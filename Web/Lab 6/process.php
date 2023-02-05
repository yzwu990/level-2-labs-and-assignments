<!DOCTYPE html>
<html>

<head lang="en">
    <meta charset="utf-8">
    <title>Chapter 12</title>

    <link rel="stylesheet" href="./css/styles1.css" />


</head>


<body class="process">

    <!-- PHP scripts -->
    <?php

    // import header
    include 'headerM.php';


    if (isset($_POST['submit'])) {
        // receive values from posth method
        $GLOBALS['title'] = $_POST["title"];
        $GLOBALS["description"] = $_POST["description"];
        $GLOBALS["genre"] = $_POST["genre"];
        $GLOBALS["subject"] = $_POST["subject"];
        $GLOBALS["Star"] = $_POST["Star"];
        $GLOBALS["year"] = $_POST["year"];
        $GLOBALS["Production"] = $_POST["Production"];
    }
    // display information as table
    echo "

    <main class='results'>

        <p class='results__caption'>Movie Information Saved</p>

        <table>
            <tr>
                <td class='results__td'>Title</td>
                <td>$title</td>
            </tr>
            <tr>
                <td class='results__td'>Description</td>
                <td >$description</td>
            </tr>
            <tr>
                <td class='results__td'>Genre</td>
                <td>$genre</td>
            </tr>
            <tr>
                <td class='results__td'>Subject</td>
                <td>$subject</td>
            </tr>
            <tr>
                <td class='results__td'>Star</td>
                <td>$Star</td>
            </tr>
            <tr>
                <td class='results__td'>Year</td>
                <td>$year</td>
            </tr>
            <tr>
                <td class='results__td'>Production</td>
                <td>$Production</td>
            </tr>
        </table>
        
    </main>";

    // import footer
    include 'footerM.php'; ?>
    
</body>

</html>