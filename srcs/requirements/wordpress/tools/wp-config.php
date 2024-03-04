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
define( 'DB_NAME', ___DATABASE_NAME___ );

/** O nome do utilizador de MySQL */
define( 'DB_USER', ___MYSQL_USER___ );

/** A password do utilizador de MySQL  */
define( 'DB_PASSWORD', ___MYSQL_PASSWORD___ );

/** O nome do serviddor de  MySQL  */
define( 'DB_HOST', ___HOSTNAME___ );

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
define('AUTH_KEY',         '+|X[9Xa+;pJ|7o^9aEm^/?1#uCP|j{^TA5dro!D[1m|uM?yt<RGKYg3zE(ZFj|S9');
define('SECURE_AUTH_KEY',  'p7>|V~P_8R>zr>)@O]y;h{smE6Hc_>w.T(4^oLJ+V_6=BW[kh/y|^i+_VTvAETZk');
define('LOGGED_IN_KEY',    'c]K]#p(Vl>w.s&XcS!c=9d>N-D=kJv75-@,x<^OR%*X@!6y{TsQ4imx>#^gb;,]C');
define('NONCE_KEY',        '%h-D+FC9WQM1q=P*> !Z|MlEe2S~Ov!hMR@pl+I>)I+kSRogZx2H%A3OlMjBj`+I');
define('AUTH_SALT',        'Oy,revu!,.C@5ZTf]B<|JiY]Sp!%2cjK%B ZJg}1|ar%+s/#kbu9]|[_*LpqO>x=');
define('SECURE_AUTH_SALT', 'tWz>gpar#Qkq]sZ[*(y)/`<;k4 -9~XWeT( WI dJ*DKa^UTi+Ccpw-4*Yw*{xXw');
define('LOGGED_IN_SALT',   '-W_lYXuO2]D;s7E&&o%e,%s2evu<gac}Z BHP><4aiiCIle/,-oG$V`WEgQ_s>8l');
define('NONCE_SALT',       'ehM)`[s7zbDgowH^v-{/8Y^}rX^c$jElu+bn;99nmUo8]6`&g-7rYuMp(aZFL4+w');
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
