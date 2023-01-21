<?php
	$connection = mysqli_connect("localhost","root","");
	$db = mysqli_select_db($connection,"lms");
    $query1 = "select s_no,book_name,book_author,book_no,student_id,issue_date, returned_date from issued_books where book_no = $_GET[bn]";
	
    $query_run = mysqli_query($connection,$query1);
					while($row = mysqli_fetch_assoc($query_run)){
                        $s_no = $row['s_no'];
						$book_name = $row['book_name'];
						$book_author = $row['book_author'];
						$book_no = $row['book_no'];
                        $student_id = $row['student_id'];
						$student_name = $row['name'];
                    }
                    $query2 = "insert into returned_table values($_POST[s_no],$_POST[book_no],'$_POST[book_name]','$_POST[book_author]',$_POST[student_id],1,'$_POST[issue_date]',null)";
		$query_run = mysqli_query($connection,$query2);
?>
<?php
					
        $query = "delete from issued_books where book_no = $_GET[bn]";
        $query_run = mysqli_query($connection,$query);
				?>





















<script type="text/javascript">
	alert("Book Deleted...");
	window.location.href = "manage_book.php";
</script>