<?php
date_default_timezone_set('Asia/Tokyo');
header('Content-Type: text/plain; charset=UTF-8');
header('Content-Type: application/json; charset=UTF-8');
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PATCH, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding, Origin, Accept, Access-Control-Allow-Headers, Authorization, X-Requested-With");
header('X-Powered-By: Hidden');
header_register_callback(function(){ header_remove('X-Powered-By'); });

$config = dirname(__FILE__) . '/' . '.env';
$config_loaded = false;
if ( file_exists($config) && filesize($config) > 0 ) {
	try {
		$config = json_decode(file_get_contents($config), true);
		$config_loaded = true;
	} catch (\Exception $e) {
		unset($config);
		$config_loaded = false;
	}
}

$_SESSION = [];
$request = [];
$result = [];
if ($config_loaded) {
	$result = $config['internal']['default']['result'];
}

try {
	if ($config_loaded && $config['internal']['databases']['activate'] && $config['internal']['databases']['primary']['activate']) {
		$dsn = [
			'scheme' => $config['internal']['databases']['primary']['scheme'],
			'host' => $config['internal']['databases']['primary']['host'],
			'port' => $config['internal']['databases']['primary']['port'],
			'dbname' => $config['internal']['databases']['primary']['dbname'],
			'username' => $config['internal']['databases']['primary']['username'],
			'password' => $config['internal']['databases']['primary']['password'],
		];
		try {
			$pdo = new \PDO(
				''.$dsn['scheme'].':'.
				'host='.$dsn['host'].';'.
				'port='.$dsn['port'].';'.
				'dbname='.$dsn['dbname'].';'.
				'user='.$dsn['username'].';'.
				'password='.$dsn['password'].''.
				''
			);
			$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$pdo->setAttribute(PDO::ATTR_TIMEOUT, 10);
			$pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
			
			$sql = 'select *, 1 as count from mondai_category where deleted = false order by uuid asc;';
			$stm = $pdo -> prepare($sql);
			$res = $stm -> execute();
			if (!$res) {
			}
			$res = $stm -> fetchAll();
			$res = json_encode($res, JSON_UNESCAPED_UNICODE );
			echo $res;
		} catch (\Exception $th) {
			error_log( $th->getMessage() . PHP_EOL . '' . __FILE__ . '#' . __LINE__ );
			echo $th->getMessage() . PHP_EOL;
		}
	} else {
		echo 1 . PHP_EOL;
		var_dump($config_loaded);
	}
} catch (\Exception $th) {
	error_log( $th->getMessage() . PHP_EOL . '' . __FILE__ . '#' . __LINE__ );
	echo $th->getMessage() . PHP_EOL;
}
