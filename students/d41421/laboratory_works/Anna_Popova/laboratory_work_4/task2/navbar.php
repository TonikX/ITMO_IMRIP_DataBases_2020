
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/task2/">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Editor tool</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Overview
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
			  <?php
	  $pdo = new PDO("pgsql:host=$host;dbname=$dbname", $dbuser, $dbpass);
	  $stmt = $pdo->query("SELECT tablename FROM pg_catalog.pg_tables WHERE schemaname != 'pg_catalog' AND schemaname != 'information_schema';");
	  
	  foreach($stmt->fetchAll() as $key=>$value){
	  echo '<a class="dropdown-item" href="?mode=overview&table='.$value['tablename'].'">'.str_replace("_", " ", ucfirst($value['tablename'])).'</a>';
	  }
	  ?>
          <div class="dropdown-divider"></div>
          <!--<a class="dropdown-item" href="#">Another action</a-->
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
      </li>
    </ul>

  </div>
</nav>
