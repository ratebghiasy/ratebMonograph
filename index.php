<?php require_once("./config/manifest.php"); ?>
<?php require_once("./module/modules.php"); ?>

<!DOCTYPE html>
<html lang="">

<head>
    <meta charset="utf-8">
    <title><?php echo $websiteTitle; ?></title>
    <meta name="author" content="<?php echo $websiteAuthor; ?>">
    <meta name="description" content="<?php echo $websiteDetails; ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./style/<?php echo $websiteStyleSheets['main']; ?>">
    <link rel="stylesheet" href="./style/<?php echo $websiteStyleSheets['mobile']; ?>" media="<?php echo $mediaQueries['mobile']; ?>">
    <link rel="icon" type="image/x-icon" href="" />
</head>

<body>
    <!--  MAIN NAVBAR  -->
    <div class="main-navbar">
    </div>

    <!--  MAIN BODY  -->
    <div class="main-body"></div>

    <!--  MAIN FOOTER  -->
    <div class="main-footer"></div>
</body>


</html>
