<?php

  $nav_selected = "MOVIES";
  $left_buttons = "YES";
  $left_selected = "RELEASES";

  include("./nav.php");
  global $db;

  ?>


<div class="right-content">
    <div class="container">

      <h3 style = "color: #01B0F1;">Movies</h3>

        <h3><img src="images/releases.png" style="max-height: 35px;" />List of Movies</h3>

        <table id="info" cellpadding="0" cellspacing="0" border="0"
            class="datatable table table-striped table-bordered datatable-style table-hover"
            width="100%" style="width: 100px;">
              <thead>
                <tr id="table-first-row">
                        <th>Name (Native Lang)</th>
                        <th>Name (English Lang)</th>
                        <th>Year</th>
						<th>Country</th>
						<th>Language</th>
                </tr>
              </thead>

              <tfoot>
                <tr>
                        <th></th>
                        <th></th>
                        <th></th>
                </tr>
              </tfoot>

              <tbody>

              <?php

$sql = "SELECT * from movies ORDER BY release_date ASC;";
$result = $db->query($sql);

                if ($result->num_rows > 0) {
                    // output data of each row
                    while($row = $result->fetch_assoc()) {
                        echo '<tr>
                                <td>'.$row["native_name"].'</td>
                                <td><a href="movie_info.php?movie='.$row["native_name"].'">'.$row["english_name"].'</a></td>
                                <td>'.$row["release_date"].'</td>
                                <td>'.$row["country"].'</td>
                                <td>'.$row["language"].'</td> 
                              </tr>';
                    }//end while
                }//end if
                else {
                    echo "0 results";
                }//end else

                 $result->close();
                ?>

              </tbody>
        </table>


        <script type="text/javascript" language="javascript">
    $(document).ready( function () {

        $('#info').DataTable( {
            dom: 'lfrtBip',
            buttons: [
                'copy', 'excel', 'csv', 'pdf'
            ] }
        );

        $('#info thead tr').clone(true).appendTo( '#info thead' );
        $('#info thead tr:eq(1) th').each( function (i) {
            var title = $(this).text();
            $(this).html( '<input type="text" placeholder="Search '+title+'" />' );

            $( 'input', this ).on( 'keyup change', function () {
                if ( table.column(i).search() !== this.value ) {
                    table
                        .column(i)
                        .search( this.value )
                        .draw();
                }
            } );
        } );

        var table = $('#info').DataTable( {
            orderCellsTop: true,
            fixedHeader: true,
            retrieve: true
        } );

    } );

</script>



 <style>
   tfoot {
     display: table-header-group;
   }
 </style>

  <?php include("./footer.php"); ?>
