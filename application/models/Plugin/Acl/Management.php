<?php
require_once 'Zend/Controller/Plugin/Abstract.php';
    class Plugin_Acl_Management extends Zend_Controller_Plugin_Abstract
    {
        // default user role if not logged or (or invalid role found)
        private $_defaultRole = 'guest';
        public $auth;
        public $acl;

        // the action to dispatch if a user doesn't have sufficient privileges
        private $_authController = array('controller' => 'account',
                                         'action' => 'index');

        public function __construct(Zend_Auth $auth)
        {
            $this->auth = $auth;
            $this->acl = new Zend_Acl();

            /*
             * 分配角色
             * 游客
             * 用户
             * 	管理员
             */
            $this->acl->addRole(new Zend_Acl_Role($this->_defaultRole));
            $this->acl->addRole(new Zend_Acl_Role('user'));
            $this->acl->addRole(new Zend_Acl_Role('administrator'));

            // add the resources we want to have control over
            $this->acl->add(new Zend_Acl_Resource('account'));
            $this->acl->add(new Zend_Acl_Resource('error'));
            $this->acl->add(new Zend_Acl_Resource('global'));
            $this->acl->add(new Zend_Acl_Resource('userinfo'));
            $this->acl->add(new Zend_Acl_Resource('valid'));
            $this->acl->add(new Zend_Acl_Resource('days'));
            $this->acl->add(new Zend_Acl_Resource('friend'));
            $this->acl->add(new Zend_Acl_Resource('search'));
            $this->acl->add(new Zend_Acl_Resource('validnoid'));
            $this->acl->add(new Zend_Acl_Resource('noiddays'));

			$this->acl->add(new Zend_Acl_Resource('wall'));

			$this->acl->add(new Zend_Acl_Resource('befriend'));
			$this->acl->add(new Zend_Acl_Resource('message'));
			$this->acl->add(new Zend_Acl_Resource('response'));
            // allow access to everything for all users by default
            // except for the account management and administration areas
            $this->acl->deny();


            // add an exception so guests can log in or register
            // in order to gain privilege
            $this->acl->allow('guest', array('account','global','validnoid','error','noiddays','days'));

            // allow members access to the account management area
            $this->acl->allow('user');
			$this->acl->allow('administrator');

            // allows administrators access to the admin area

        }

        /**
         * preDispatch
         *
         * Before an action is dispatched, check if the current user
         * has sufficient privileges. If not, dispatch the default
         * action instead
         *
         * @param Zend_Controller_Request_Abstract $request
         */
        public function preDispatch(Zend_Controller_Request_Abstract $request)
        {
            // check if a user is logged in and has a valid role,
            // otherwise, assign them the default role (guest)
            if ($this->auth->hasIdentity())
                $role = $this->auth->getIdentity()->userType;
            else
           $role = $this->_defaultRole;

            if (!$this->acl->hasRole($role))
                $role = $this->_defaultRole;

            // the ACL resource is the requested controller name
            $resource = $request->controller;

            // the ACL privilege is the requested action name
            $privilege = $request->action;

            // if we haven't explicitly added the resource, check
            // the default global permissions
            if (!$this->acl->has($resource))
                $resource = null;


            // access denied - reroute the request to the default action handler
            if (!$this->acl->isAllowed($role, $resource, $privilege)) {
                $request->setControllerName($this->_authController['controller']);
                $request->setActionName($this->_authController['action']);
  
            }
        }
    }
?>