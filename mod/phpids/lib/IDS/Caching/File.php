<?php

/**
 * PHPIDS
 * 
 * Requirements: PHP5, SimpleXML
 *
 * Copyright (c) 2007 PHPIDS group (http://php-ids.org)
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 2 of the license.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * PHP version 5.1.6+
 * 
 * @category Security
 * @package  PHPIDS
 * @author   Mario Heiderich <mario.heiderich@gmail.com>
 * @author   Christian Matthies <ch0012@gmail.com>
 * @author   Lars Strojny <lars@strojny.net>
 * @license  http://www.gnu.org/licenses/lgpl.html LGPL
 * @link     http://php-ids.org/
 */

require_once 'IDS/Caching/Interface.php';

/**
 * File caching wrapper
 *
 * This class inhabits functionality to get and set cache via a static flatfile.
 *
 * @category  Security
 * @package   PHPIDS
 * @author    Christian Matthies <ch0012@gmail.com>
 * @author    Mario Heiderich <mario.heiderich@gmail.com>
 * @author    Lars Strojny <lars@strojny.net>
 * @copyright 2007 The PHPIDS Group
 * @license   http://www.gnu.org/licenses/lgpl.html LGPL
 * @version   Release: $Id:File.php 517 2007-09-15 15:04:13Z mario $
 * @link      http://php-ids.org/
 * @since     Version 0.4
 */
class IDS_Caching_File implements IDS_Caching_Interface
{

    /**
     * Caching type
     *
     * @var string
     */
    private $type = null;

    /**
     * Cache configuration
     *
     * @var array
     */
    private $config = null;

    /**
     * Path to cache file
     *
     * @var string
     */
    private $path = null;

    /**
     * Holds an instance of this class
     *
     * @var object
     */
    private static $cachingInstance = null;

    /**
     * Constructor
     *
     * @param string $type   caching type
     * @param array  $config caching configuration
     * 
     * @return void
     */
    public function __construct($type, $config)
    {

        $this->type   = $type;
        $this->config = $config;
        $this->path   = $this->config['path'];

        if (file_exists($this->path) && !is_writable($this->path)) {
            throw new Exception('Make sure all files in IDS/tmp ' . 
                'are writeable!');
        }
    }

    /**
     * Returns an instance of this class
     *
     * @param string $type   caching type
     * @param array  $config caching configuration
     * 
     * @return object $this
     */
    public static function getInstance($type, $config)
    {
        if (!self::$cachingInstance) {
            self::$cachingInstance = new IDS_Caching_File($type, $config);
        }

        return self::$cachingInstance;
    }

    /**
     * Writes cache data into the file
     *
     * @param array $data the cache data
     * 
     * @throws Exception if cache file couldn't be created
     * @return object $this
     */
    public function setCache(array $data) 
    {
		
        if (!is_writable(preg_replace('/[\/][^\/]+\.[^\/]++$/', null, 
            $this->path))) {
            throw new Exception("Temp directory seems not writable");
        }    	
        
        if ((!file_exists($this->path) || (time()-filectime($this->path)) > 
            $this->config['expiration_time'])) {
            $handle = @fopen($this->path, 'w+');
            
            if (!$handle) {
                throw new Exception("Cache file couldn't be created");
            }
            
            fwrite($handle, serialize($data));
            fclose($handle);
        }

        return $this;
    }

    /**
     * Returns the cached data
     *
     * Note that this method returns false if either type or file cache is 
     * not set
     * 
     * @return mixed cache data or false
     */
    public function getCache() 
    {

        // make sure filters are parsed again if cache expired
        if (file_exists($this->path) && (time()-filectime($this->path)) < 
            $this->config['expiration_time']) {
            $data = unserialize(file_get_contents($this->path));
              return $data;
        }

        return false;
    }
}

/*
 * Local variables:
 * tab-width: 4
 * c-basic-offset: 4
 * End:
 */
