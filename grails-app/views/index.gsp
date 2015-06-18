<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
        <!--jQuery dependencies-->
        <link rel="stylesheet"
              href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/themes/base/jquery-ui.css" />
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>

        <!--ParamQuery Grid files-->
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'pqgrid.min.css')}" />
        <g:javascript src="pqgrid.min.js" />

        <script>
            $(function(){
                var data = [ ['Balloon Bursting','','','','','','','','',''],
                    ['Kadang 2','','','','','','','','',''],
                    ['Sack Race','','','','','','','','',''],
                    ['Straw & Bottle Relay','','','','','','','','',''],
                    ['Dress & Dribble','','','','','','','','',''],
                    ['Hula Body','','','','','','','','',''],
                    ['Pass the Ball','','','','','','','','',''],
                    ['Pinoy Henyo','','','','','','','','',''],
                    ['Tug of War','','','','','','','','',''],
                    ['Premyo o Kahon','','','','','','','','','']];

                var obj = {};
                obj.colModel = [{title:"Games/Team", width:100, dataType:"string", align:"center"},
                    {title:"Bulacan North", width:70, dataType:"string", align:"center"},
                    {title:"Bulacan South", width:70, dataType:"checkbox", align:"center"},
                    {title:"Central", width:70, dataType:"integer", align:"center"},
                    {title:"Central Office", width:70, dataType:"integer", align:"center"},
                    {title:"MMNorth", width:70, dataType:"integer", align:"center"},
                    {title:"Pampanga East", width:70, dataType:"integer", align:"center"},
                    {title:"Pampanga West", width:70, dataType:"integer", align:"center"},
                    {title:"Quezon City", width:70, dataType:"integer", align:"center"},
                    {title:"Rizal", width:70, dataType:"integer", align:"center"}
                ];
                obj.dataModel = {data:data};
                var $grid = $("#grid_array").pqGrid( obj );
                $grid.pqGrid("option", "flexHeight", true);
                $grid.pqGrid("option", "flexWidth", true);
                $grid.pqGrid("option", "scrollModel", {
                    horizontal: false
                });

            });
        </script>
    </head>
	<body>
		<div id="page-body" role="main">
            <div id="grid_array"></div>
		</div>
	</body>
</html>
