<?php
include 'dbconnect.php';

$queryType = isset($_POST['queryType']) ? $_POST['queryType'] : ''; // choosing a query type
$searchTerm = isset($_POST['searchTerm']) ? $_POST['searchTerm'] : ''; //choosing search terms for the query

function getQueryResult($conn, $query) { //function to get the query result
    $result = mysqli_query($conn, $query);
    if (mysqli_num_rows($result) > 0) {
        return $result;
    } else {
        return null;
    }
}

function displayResult($result) { //this function takes the qeury result and displays it
    if ($result !== null) {
        echo "<table border='1'><tr>";
        while ($fieldinfo = mysqli_fetch_field($result)) {
            echo "<th>{$fieldinfo->name}</th>";
        }
        echo "</tr>";
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            foreach ($row as $value) {
                echo "<td>" . htmlspecialchars($value) . "</td>";
            }
            echo "</tr>";
        }
        echo "</table>";
    } else {
        echo "No results found.";
    }
}

?>

<!DOCTYPE html>
<html>
<head>
    <title>Top Searches</title>
</head>
<body>
    <h1>Perform a Search</h1>
    <form action="topSearches.php" method="POST">
        <label for="queryType">Select Query:</label> <!-- listing all the possible queries that were requiered in P2-->
        <select id="queryType" name="queryType"> 
            <option value="articlesByVolume" <?php if ($queryType == 'articlesByVolume') echo 'selected'; ?>>List the articles submitted to a specific volume</option>
            <option value="nonEditorAuthorReviewer" <?php if ($queryType == 'nonEditorAuthorReviewer') echo 'selected'; ?>>List the people who are not editor, not author, not reviewer in a specific volume</option>
            <option value="assignableReviewers" <?php if ($queryType == 'assignableReviewers') echo 'selected'; ?>>List people who can be assigned as a reviewer to any article of a specific volume</option>
            <option value="reviewersAndScores" <?php if ($queryType == 'reviewersAndScores') echo 'selected'; ?>>List the reviewers and the scores they assigned for a specific submission</option>
            <option value="resultBasedOnScores" <?php if ($queryType == 'resultBasedOnScores') echo 'selected'; ?>>Calculate the result based on the scores assigned by reviewers for a specific submission</option>
            <option value="acceptedArticlesAuthors" <?php if ($queryType == 'acceptedArticlesAuthors') echo 'selected'; ?>>List the corresponding authors and titles of accepted articles for a specific volume</option>
            <option value="articlesAuthorsReviewers" <?php if ($queryType == 'articlesAuthorsReviewers') echo 'selected'; ?>>List submitted articles, authors, and reviewers for a specific volume</option>
            <option value="minArticleReviewers" <?php if ($queryType == 'minArticleReviewers') echo 'selected'; ?>>List people who reviewed the minimum number of articles</option>
            <option value="productiveAuthors" <?php if ($queryType == 'productiveAuthors') echo 'selected'; ?>>List the most productive authors (with maximum accepted articles)</option>
            <option value="articlesByAuthor" <?php if ($queryType == 'articlesByAuthor') echo 'selected'; ?>>List articles' titles and status of a specific author</option>
        </select>
        <br><br>
        <label for="searchTerm">Enter Search Term:</label> <!-- Entering a specifc term-->
        <input type="text" id="searchTerm" name="searchTerm" value="<?php echo htmlspecialchars($searchTerm); ?>">
        <br><br>
        <button type="submit">Search</button>
    </form>

    <h2>Results:</h2>
    <?php
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        switch ($queryType) { //All of these queries were taken from P2 of G21 (22comp1064, 19comp1100)
            case 'articlesByVolume':
                $query = "SELECT * FROM article WHERE volName = '$searchTerm'";
                $result = getQueryResult($conn, $query);
                displayResult($result);
                break;
            case 'nonEditorAuthorReviewer':
                $query = "SELECT * FROM person WHERE isReviewer = false AND isAuthor = false AND isEditor = false AND vname = '$searchTerm'";
                $result = getQueryResult($conn, $query);
                displayResult($result);
                break;
            case 'assignableReviewers':
                $query = "SELECT DISTINCT P.* FROM Person P JOIN PersonInterest I ON P.email = i.email JOIN ArticleKeywords K ON I.email = K.email JOIN Article A ON K.aid = A.id WHERE P.isReviewer = true AND A.volName = '$searchTerm'";
                $result = getQueryResult($conn, $query);
                displayResult($result);
                break;
            case 'reviewersAndScores':
                if (!empty($searchTerm)) {
                    $query = "SELECT P.*, R.scoreOfTheReviewer FROM Article A JOIN ArticleReviews R ON R.id = A.id JOIN Person P ON P.email = R.email WHERE A.submissionDate IS NOT NULL AND A.id = '$searchTerm'";
                    $result = getQueryResult($conn, $query);
                    displayResult($result);
                } else {
                    echo "Please enter a valid submission ID.";
                }
                break;
            case 'resultBasedOnScores':
                if (!empty($searchTerm)) {
                    $query = "SELECT Article.id, Article.title, AVG(ArticleReviews.scoreOfTheReviewer) AS AverageScore,
                                     IF(AVG(ArticleReviews.scoreOfTheReviewer) = 1, 'Accept', 
                                        IF(AVG(ArticleReviews.scoreOfTheReviewer) = 0, 'Reject', 'Revision')) AS Result
                              FROM Article
                              JOIN ArticleReviews ON Article.id = ArticleReviews.id
                              WHERE Article.submissionDate IS NOT NULL AND Article.id = '$searchTerm'
                              GROUP BY Article.id, Article.title";
                    $result = getQueryResult($conn, $query);
                    displayResult($result);
                } else {
                    echo "Please enter a valid submission ID.";
                }
                break;
            case 'acceptedArticlesAuthors':
                $query = "SELECT correspAut, title FROM article WHERE result = 'Accept' AND volName = '$searchTerm'";
                $result = getQueryResult($conn, $query);
                displayResult($result);
                break;
            case 'articlesAuthorsReviewers':
                $query = "SELECT A.title AS ArticleTitle, PA.name AS AuthorName, PR.name AS ReviewerName
                          FROM Article A
                          JOIN WrittenBy WB ON A.id = WB.id
                          JOIN Person PA ON WB.email = PA.email
                          LEFT JOIN ArticleReviews AR ON A.id = AR.id
                          LEFT JOIN Person PR ON AR.email = PR.email
                          WHERE A.volName = '$searchTerm' AND A.submissionDate IS NOT NULL";
                $result = getQueryResult($conn, $query);
                displayResult($result);
                break;
            case 'minArticleReviewers':
                $query = "WITH ReviewCounts AS (
                              SELECT name, COUNT(*) AS NumberOfReviews
                              FROM ArticleReviews AR, Person P
                              WHERE AR.email = P.email
                              GROUP BY name
                          )
                          SELECT name, NumberOfReviews
                          FROM ReviewCounts
                          WHERE NumberOfReviews = (SELECT MIN(NumberOfReviews) FROM ReviewCounts)";
                $result = getQueryResult($conn, $query);
                displayResult($result);
                break;
            case 'productiveAuthors':
                $query = "WITH AcceptCount AS (
                              SELECT name, COUNT(*) AS NumOfAcceptedArticles
                              FROM WrittenBy WB
                              JOIN Person P ON WB.email = P.email
                              JOIN Article A ON WB.id = A.id
                              WHERE A.result = 'Accept'
                              GROUP BY name
                          )
                          SELECT name, NumOfAcceptedArticles
                          FROM AcceptCount
                          WHERE NumOfAcceptedArticles = (SELECT MAX(NumOfAcceptedArticles) FROM AcceptCount)";
                $result = getQueryResult($conn, $query);
                displayResult($result);
                break;
            case 'articlesByAuthor':
                if (!empty($searchTerm)) {
                    $query = "SELECT DISTINCT A.title, A.result
                              FROM Article A
                              JOIN WrittenBy WB ON WB.id = A.id
                              WHERE WB.email = '$searchTerm'";
                    $result = getQueryResult($conn, $query);
                    displayResult($result);
                } else {
                    echo "Please enter a valid email address.";
                }
                break;
            default:
                echo "Invalid query type.";
        }
    }
    ?>

</body>
</html>

<?php
mysqli_close($conn);
