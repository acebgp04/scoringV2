<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Freelancer - Start Bootstrap Theme</title>

    <!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
    <link href="${resource(dir: 'css', file: 'bootstrap.min.css')}" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${resource(dir: 'css', file: 'freelancer.css')}" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${resource(dir: 'font-awesome', file: 'css/font-awesome.min.css')}" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!--jQuery dependencies-->
    <link rel="stylesheet"
          href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/themes/base/jquery-ui.css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>

    <!--ParamQuery Grid files-->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'pqgrid.min.css')}" />

    <g:javascript src="pqgrid.min.js" />
    <script type="text/css">
        div.pq-grid-summary{
            height:21px;border-bottom:1px solid #ddd;border-top:1px solid #fff;position:relative;
        }
        div.pq-grid-summary table.pq-grid-table{
            position:absolute;top:0px;
        }
        div.pq-grid {
            font-size: 18px !important;
        }
    </script>
    <script>

        $(function(){
            var data = [ ['Balloon Bursting','0','0','0','0','0','0','0','0','0'],
                ['Kadang 2','0','0','0','0','0','0','0','0','0'],
                ['Sack Race','0','0','0','0','0','0','0','0','0'],
                ['Straw & Bottle Relay','0','0','0','0','0','0','0','0','0'],
                ['Dress & Dribble','0','0','0','0','0','0','0','0','0'],
                ['Hula Body','0','0','0','0','0','0','0','0','0'],
                ['Pass the Ball','0','0','0','0','0','0','0','0','0'],
                ['Pinoy Henyo','0','0','0','0','0','0','0','0','0'],
                ['Tug of War','0','0','0','0','0','0','0','0','0'],
                ['Premyo o Kahon','0','0','0','0','0','0','0','0','0']];

            var obj = {};
            //calculate sum of 3rd and 4th column.
            var summaryData;
            function calculateSummary() {
                var bulacanNorthTotal = 0, bulacanSouthTotal = 0, centralTotal = 0, centralOfficeTotal = 0, mmNorthTotal = 0, pampangaEastTotal = 0, pampangaWestTotal = 0, quezonCityTotal = 0, rizalTotal = 0;
                for (var i = 0; i < data.length; i++) {
                    var row = data[i];
                    bulacanNorthTotal += parseInt(row[1].replace(",", ""));
                    bulacanSouthTotal += parseInt(row[2].replace(",", ""));
                    centralTotal += parseInt(row[3].replace(",", ""));
                    centralOfficeTotal += parseFloat(row[4].replace(",", ""));
                    mmNorthTotal += parseFloat(row[5].replace(",", ""));
                    pampangaEastTotal += parseFloat(row[6].replace(",", ""));
                    pampangaWestTotal += parseFloat(row[7].replace(",", ""));
                    quezonCityTotal += parseFloat(row[8].replace(",", ""));
                    rizalTotal += parseFloat(row[9].replace(",", ""));
                }
                bulacanNorthTotal = (bulacanNorthTotal);
                bulacanSouthTotal = (bulacanSouthTotal);
                centralTotal = (centralTotal);
                centralOfficeTotal = (centralOfficeTotal);
                mmNorthTotal = (mmNorthTotal);
                pampangaEastTotal = (pampangaEastTotal);
                pampangaWestTotal = (pampangaWestTotal);
                quezonCityTotal = (quezonCityTotal);
                rizalTotal = (rizalTotal);
                summaryData = ["<b>Total</b>", bulacanNorthTotal, bulacanSouthTotal, centralTotal, centralOfficeTotal, mmNorthTotal, pampangaEastTotal, pampangaWestTotal, quezonCityTotal, rizalTotal];
            }
            var obj = { width: 1150, height: 400, title: "Summary of rows", resizable: true, freezeCols: 1,
                numberCell: true,
                selectionModel: { type: 'row' },
                scrollModel: { horizontal: true }
            };

            obj.colModel = [{title:"Games/Team", width:200, dataType:"string", align:"center"},
                {title:"Bulacan North", width:110, dataType:"string", align:"center"},
                {title:"Bulacan South", width:110, dataType:"checkbox", align:"center"},
                {title:"Central", width:100, dataType:"integer", align:"center"},
                {title:"Central Office", width:100, dataType:"integer", align:"center"},
                {title:"MMNorth", width:100, dataType:"integer", align:"center"},
                {title:"Pampanga East", width:120, dataType:"integer", align:"center"},
                {title:"Pampanga West", width:120, dataType:"integer", align:"center"},
                {title:"Quezon City", width:90, dataType:"integer", align:"center"},
                {title:"Rizal", width:90, dataType:"integer", align:"center"}
            ];
            obj.dataModel = {data:data};
            var $summary = "";
            obj.render = function (evt, ui) {
                $summary = $("<div class='pq-grid-summary'  ></div>")
                        .prependTo($(".pq-grid-bottom", this));
                calculateSummary();
            }
            //refresh summary whenever a value in any cell changes.
            obj.cellSave = function (ui) {
                calculateSummary();
                obj.refresh();
            }
            obj.refresh = function (evt, ui) {
                //var data = [summaryData, ["Second row for testing", "row", "for", "testing"]]; //2 dimensional array.
                var data = [summaryData]; //2 dimensional array
                var obj = { data: data, $cont: $summary }
                $grid.pqGrid("createTable", obj);
            }
            var $grid = $("#grid_array").pqGrid( obj );
            $grid.pqGrid("option", "flexHeight", true);
            $grid.pqGrid("option", "flexWidth", false);
            $grid.pqGrid("option", "numberCell", false);
            $grid.pqGrid("option", "scrollModel", {
                horizontal: false
            });

        });
    </script>
</head>

<body id="page-top" class="index">

<!-- Navigation -->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header page-scroll">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#page-top">Welcome Kapatid ko</a>
        </div>

        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>

<!-- Header -->
<header>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <img class="img-responsive" src="${resource(dir: 'images', file: 'profile.png')}" alt="">
                <div class="intro-text">
                    <span class="name">Scoring System</span>
                    <hr class="star-light">
                </div>
            </div>
        </div>
    </div>
</header>

<!-- Portfolio Grid Section -->
<section id="portfolio">
    <div class="container" style="margin-left: auto; margin-right: auto">
        <div id="grid_array"></div>
    </div>
</section>


<!-- Contact Section -->
<section id="contact">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2>Contact Me</h2>
                <hr class="star-primary">
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
                <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
                <form name="sentMessage" id="contactForm" novalidate>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Name</label>
                            <input type="text" class="form-control" placeholder="Name" id="name" required data-validation-required-message="Please enter your name.">
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Email Address</label>
                            <input type="email" class="form-control" placeholder="Email Address" id="email" required data-validation-required-message="Please enter your email address.">
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Phone Number</label>
                            <input type="tel" class="form-control" placeholder="Phone Number" id="phone" required data-validation-required-message="Please enter your phone number.">
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Message</label>
                            <textarea rows="5" class="form-control" placeholder="Message" id="message" required data-validation-required-message="Please enter a message."></textarea>
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <br>
                    <div id="success"></div>
                    <div class="row">
                        <div class="form-group col-xs-12">
                            <button type="submit" class="btn btn-success btn-lg">Send</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="text-center">
    <div class="footer-above">
        <div class="container">
            <div class="row">
                <div class="footer-col col-md-4">
                    <h3>Location</h3>
                    <p>3481 Melrose Place<br>Beverly Hills, CA 90210</p>
                </div>
                <div class="footer-col col-md-4">
                    <h3>Around the Web</h3>
                    <ul class="list-inline">
                        <li>
                            <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-facebook"></i></a>
                        </li>
                        <li>
                            <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-google-plus"></i></a>
                        </li>
                        <li>
                            <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-twitter"></i></a>
                        </li>
                        <li>
                            <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-linkedin"></i></a>
                        </li>
                        <li>
                            <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-dribbble"></i></a>
                        </li>
                    </ul>
                </div>
                <div class="footer-col col-md-4">
                    <h3>About Freelancer</h3>
                    <p>Freelance is a free to use, open source Bootstrap theme created by <a href="http://startbootstrap.com">Start Bootstrap</a>.</p>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-below">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    Copyright &copy; Your Website 2014
                </div>
            </div>
        </div>
    </div>
</footer>

<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
<div class="scroll-top page-scroll visible-xs visible-sm">
    <a class="btn btn-primary" href="#page-top">
        <i class="fa fa-chevron-up"></i>
    </a>
</div>

<!-- Portfolio Modals -->
<div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-content">
        <div class="close-modal" data-dismiss="modal">
            <div class="lr">
                <div class="rl">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="modal-body">
                        <h2>Project Title</h2>
                        <hr class="star-primary">
                        <img src="img/portfolio/cabin.png" class="img-responsive img-centered" alt="">
                        <p>Use this area of the page to describe your project. The icon above is part of a free icon set by <a href="https://sellfy.com/p/8Q9P/jV3VZ/">Flat Icons</a>. On their website, you can download their free set with 16 icons, or you can purchase the entire set with 146 icons for only $12!</p>
                        <ul class="list-inline item-details">
                            <li>Client:
                                <strong><a href="http://startbootstrap.com">Start Bootstrap</a>
                                </strong>
                            </li>
                            <li>Date:
                                <strong><a href="http://startbootstrap.com">April 2014</a>
                                </strong>
                            </li>
                            <li>Service:
                                <strong><a href="http://startbootstrap.com">Web Development</a>
                                </strong>
                            </li>
                        </ul>
                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-content">
        <div class="close-modal" data-dismiss="modal">
            <div class="lr">
                <div class="rl">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="modal-body">
                        <h2>Project Title</h2>
                        <hr class="star-primary">
                        <img src="img/portfolio/cake.png" class="img-responsive img-centered" alt="">
                        <p>Use this area of the page to describe your project. The icon above is part of a free icon set by <a href="https://sellfy.com/p/8Q9P/jV3VZ/">Flat Icons</a>. On their website, you can download their free set with 16 icons, or you can purchase the entire set with 146 icons for only $12!</p>
                        <ul class="list-inline item-details">
                            <li>Client:
                                <strong><a href="http://startbootstrap.com">Start Bootstrap</a>
                                </strong>
                            </li>
                            <li>Date:
                                <strong><a href="http://startbootstrap.com">April 2014</a>
                                </strong>
                            </li>
                            <li>Service:
                                <strong><a href="http://startbootstrap.com">Web Development</a>
                                </strong>
                            </li>
                        </ul>
                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-content">
        <div class="close-modal" data-dismiss="modal">
            <div class="lr">
                <div class="rl">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="modal-body">
                        <h2>Project Title</h2>
                        <hr class="star-primary">
                        <img src="img/portfolio/circus.png" class="img-responsive img-centered" alt="">
                        <p>Use this area of the page to describe your project. The icon above is part of a free icon set by <a href="https://sellfy.com/p/8Q9P/jV3VZ/">Flat Icons</a>. On their website, you can download their free set with 16 icons, or you can purchase the entire set with 146 icons for only $12!</p>
                        <ul class="list-inline item-details">
                            <li>Client:
                                <strong><a href="http://startbootstrap.com">Start Bootstrap</a>
                                </strong>
                            </li>
                            <li>Date:
                                <strong><a href="http://startbootstrap.com">April 2014</a>
                                </strong>
                            </li>
                            <li>Service:
                                <strong><a href="http://startbootstrap.com">Web Development</a>
                                </strong>
                            </li>
                        </ul>
                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-content">
        <div class="close-modal" data-dismiss="modal">
            <div class="lr">
                <div class="rl">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="modal-body">
                        <h2>Project Title</h2>
                        <hr class="star-primary">
                        <img src="img/portfolio/game.png" class="img-responsive img-centered" alt="">
                        <p>Use this area of the page to describe your project. The icon above is part of a free icon set by <a href="https://sellfy.com/p/8Q9P/jV3VZ/">Flat Icons</a>. On their website, you can download their free set with 16 icons, or you can purchase the entire set with 146 icons for only $12!</p>
                        <ul class="list-inline item-details">
                            <li>Client:
                                <strong><a href="http://startbootstrap.com">Start Bootstrap</a>
                                </strong>
                            </li>
                            <li>Date:
                                <strong><a href="http://startbootstrap.com">April 2014</a>
                                </strong>
                            </li>
                            <li>Service:
                                <strong><a href="http://startbootstrap.com">Web Development</a>
                                </strong>
                            </li>
                        </ul>
                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-content">
        <div class="close-modal" data-dismiss="modal">
            <div class="lr">
                <div class="rl">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="modal-body">
                        <h2>Project Title</h2>
                        <hr class="star-primary">
                        <img src="img/portfolio/safe.png" class="img-responsive img-centered" alt="">
                        <p>Use this area of the page to describe your project. The icon above is part of a free icon set by <a href="https://sellfy.com/p/8Q9P/jV3VZ/">Flat Icons</a>. On their website, you can download their free set with 16 icons, or you can purchase the entire set with 146 icons for only $12!</p>
                        <ul class="list-inline item-details">
                            <li>Client:
                                <strong><a href="http://startbootstrap.com">Start Bootstrap</a>
                                </strong>
                            </li>
                            <li>Date:
                                <strong><a href="http://startbootstrap.com">April 2014</a>
                                </strong>
                            </li>
                            <li>Service:
                                <strong><a href="http://startbootstrap.com">Web Development</a>
                                </strong>
                            </li>
                        </ul>
                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-content">
        <div class="close-modal" data-dismiss="modal">
            <div class="lr">
                <div class="rl">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="modal-body">
                        <h2>Project Title</h2>
                        <hr class="star-primary">
                        <img src="img/portfolio/submarine.png" class="img-responsive img-centered" alt="">
                        <p>Use this area of the page to describe your project. The icon above is part of a free icon set by <a href="https://sellfy.com/p/8Q9P/jV3VZ/">Flat Icons</a>. On their website, you can download their free set with 16 icons, or you can purchase the entire set with 146 icons for only $12!</p>
                        <ul class="list-inline item-details">
                            <li>Client:
                                <strong><a href="http://startbootstrap.com">Start Bootstrap</a>
                                </strong>
                            </li>
                            <li>Date:
                                <strong><a href="http://startbootstrap.com">April 2014</a>
                                </strong>
                            </li>
                            <li>Service:
                                <strong><a href="http://startbootstrap.com">Web Development</a>
                                </strong>
                            </li>
                        </ul>
                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- jQuery -->

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<!-- Plugin JavaScript -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<g:javascript src="classie.js" />
<script src="js/cbpAnimatedHeader.js"></script>
<script src="js/jqBootstrapValidation.js"></script>
<script src="js/contact_me.js"></script>
<script src="js/freelancer.js"></script>


</body>

</html>
