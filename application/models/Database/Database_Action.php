<?php
/**
 * @abstract
 * @category class
 * @author wei
 *自己定义的槽中数据库的抽象类
 */


abstract class Database_Action  {
	private $_db;
	private $_table;
	protected  function __construct($db){
		$this->_db=$db;
	}
/**
 * 
 * Enter description here ...
 * @param 单个主键 $id
 * @return 单个主键的结果集数组
 */
	public function mySelect($id){
	
		$result=$this->_table->find($id);
		$resultArray=$result->toArray();
		return $resultArray;
}
/**
 * 
 * Enter description here ...
 * @param 起始的主键 $firstNumber
 * @param 末尾的主键 $lastNumber
 * @return 主键组的结果集数组
 */
	public function mySelectAll($firstNumber,$lastNumber){
		return true;
		
	}
	protected function myPreSelect($tableName,$params){
		return true;
	}
	protected function myPostSelect(){
		return true;
	}
	
	
	protected function update(){}
	protected function preUpdate(){}
	protected function postUpdate(){}
	
	protected function insert(){}
	protected function preInsert(){}
	protected function postInsert(){}
	
	protected function delete(){}
	protected function preDelete(){}
	protected function postDelete(){}
	

}


?>