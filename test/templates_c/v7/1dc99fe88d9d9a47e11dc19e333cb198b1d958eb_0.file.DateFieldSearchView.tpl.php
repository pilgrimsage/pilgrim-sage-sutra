<?php
/* Smarty version 4.5.5, created on 2025-05-25 10:35:55
  from 'C:\xampp\htdocs\pilgrim-sage-sutra\layouts\v7\modules\Vtiger\uitypes\DateFieldSearchView.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.5',
  'unifunc' => 'content_6832f28b953702_27415322',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '1dc99fe88d9d9a47e11dc19e333cb198b1d958eb' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pilgrim-sage-sutra\\layouts\\v7\\modules\\Vtiger\\uitypes\\DateFieldSearchView.tpl',
      1 => 1747850160,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6832f28b953702_27415322 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_assignInScope('FIELD_INFO', Zend_Json::encode($_smarty_tpl->tpl_vars['FIELD_MODEL']->value->getFieldInfo()));
$_smarty_tpl->_assignInScope('dateFormat', $_smarty_tpl->tpl_vars['USER_MODEL']->value->get('date_format'));?><div class="row-fluid"><input type="text" name="<?php echo $_smarty_tpl->tpl_vars['FIELD_MODEL']->value->get('name');?>
" class="listSearchContributor inputElement dateField" data-date-format="<?php echo $_smarty_tpl->tpl_vars['dateFormat']->value;?>
" data-calendar-type="range" value="<?php if ((isset($_smarty_tpl->tpl_vars['SEARCH_INFO']->value['searchValue']))) {
echo $_smarty_tpl->tpl_vars['SEARCH_INFO']->value['searchValue'];
}?>" data-fieldinfo='<?php echo htmlspecialchars((string)$_smarty_tpl->tpl_vars['FIELD_INFO']->value, ENT_QUOTES, 'UTF-8', true);?>
'  data-field-type="<?php echo $_smarty_tpl->tpl_vars['FIELD_MODEL']->value->getFieldDataType();?>
"/></div><?php }
}
