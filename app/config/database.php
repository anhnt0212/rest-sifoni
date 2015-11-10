<?php

return array(
    'parameters' => array(
        // Connections
        'capsule.connections' => array(
            'default' => array(
                'driver'    => 'mysql',
                'host'      => '127.0.0.1',
                'database'  => 'mini-demo',
                'username'  => 'anhnt0212',
                'password'  => '',
                'charset'   => 'utf8',
                'collation' => 'utf8_unicode_ci',
                'prefix'    => '',
                'logging'   => false,
            )
        ),

        // Cache
        /*
        'capsule.cache' => array(
            'driver' => 'apc',
            'prefix' => 'sifoni',
        ),
        */
    )
);
