<?php
/**
 * A configuração de base do WordPress
 *
 * Este ficheiro define os seguintes parâmetros: MySQL settings, Table Prefix,
 * Secret Keys, WordPress Language, e ABSPATH. Pode obter mais informação
 * visitando {@link https://wordpress.org/support/article/editing-wp-config-php/ Editing
 * wp-config.php} no Codex. As definições de MySQL são-lhe fornecidas pelo seu serviço de alojamento.
 *
 * Este ficheiro contém as seguintes configurações:
 *
 * * Configurações de  MySQL
 * * Chaves secretas
 * * Prefixo das tabelas da base de dados
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Definições de MySQL - obtenha estes dados do seu serviço de alojamento** //
/** O nome da base de dados do WordPress */
define( 'DB_NAME', 'wordpress' );

/** O nome do utilizador de MySQL */
define( 'DB_USER', 'jlebre' );

/** A password do utilizador de MySQL  */
define( 'DB_PASSWORD', 'jlebre123' );

/** O nome do serviddor de  MySQL  */
define( 'DB_HOST', 'mariadb' );

/** O "Database Charset" a usar na criação das tabelas. */
define( 'DB_CHARSET', 'utf8' );

/** O "Database Collate type". Se tem dúvidas não mude. */
define( 'DB_COLLATE', '' );

/**#@+
 * Chaves únicas de autenticação.
 *
 * Mude para frases únicas e diferentes!
 * Pode gerar frases automáticamente em {@link https://api.wordpress.org/secret-key/1.1/salt/ Serviço de chaves secretas de WordPress.org}
 * Pode mudar estes valores em qualquer altura para invalidar todos os cookies existentes o que terá como resultado obrigar todos os utilizadores a voltarem a fazer login
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'L _?u:bJ&ShY<LkE|5zF^-k&ppS%-K}B]?,.ncKZ, X_,u#3u @9~R}>xI|e*c|/');
define('SECURE_AUTH_KEY',  '-pj$p&k087=>-7<Wwz_+*deR9]Bp|Lp5vnA+G+lQ`&MLf9|orxC9{bS,|.6|z#&F');
define('LOGGED_IN_KEY',    'On-s~-F7F`xPR^c7ZNNUQ{RU(-at3YekAZ}M?/3J]-#N7Qp|i-)`e9e*cKDZ87g]');
define('NONCE_KEY',        'bJ4~1)/%OUXH&ZU,SOQqQ]^p|,<*Mot&X3r#]$S!&4D;IZ_9pWka_dl;3MZPC_<[');
define('AUTH_SALT',        '+<7%>l=@YLZX,kEPyudbxQ>CouN&&{-@JG+(:9e2&|5|m78l0]W*UFzOJoY0OmsB');
define('SECURE_AUTH_SALT', '$ZG_Aj)R}f]/4<uIiir:?DxM *_6@D([8W>#Q+UUbVS+@1Q[x!`GbT_wOQ?Ckf{m');
define('LOGGED_IN_SALT',   'Yd4}X!+@MT@>&Tf>6=f%|{-%U%(PHz/|p6mTQwne!D fU~=,)I^K:]e,WCijBt,*');
define('NONCE_SALT',       'FmV.;V#MdF,aKm9c{X,$#|~xWxI+92,)m)M=H!PTA__i7{mOnsca/R]9G66;sPf#');

/**#@-*/

/**
 * Prefixo das tabelas de WordPress.
 *
 * Pode suportar múltiplas instalações numa só base de dados, ao dar a cada
 * instalação um prefixo único. Só algarismos, letras e underscores, por favor!
 */
$table_prefix = 'wp_';

/**
 * Para developers: WordPress em modo debugging.
 *
 * Mude isto para true para mostrar avisos enquanto estiver a testar.
 * É vivamente recomendado aos autores de temas e plugins usarem WP_DEBUG
 * no seu ambiente de desenvolvimento.
 *
 * Para mais informações sobre outras constantes que pode usar para debugging,
 * visite o Codex.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* E é tudo. Pare de editar! */

/** Caminho absoluto para a pasta do WordPress. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', '/var/www/html/wordpress' );
}

/** Define as variáveis do WordPress e ficheiros a incluir. */
require_once ABSPATH . 'wp-settings.php';
