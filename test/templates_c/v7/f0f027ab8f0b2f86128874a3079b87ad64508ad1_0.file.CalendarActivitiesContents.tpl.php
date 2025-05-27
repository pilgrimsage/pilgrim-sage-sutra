<?php
/* Smarty version 4.5.5, created on 2025-05-21 18:19:47
  from 'C:\xampp\htdocs\pilgrim-sage-sutra\layouts\v7\modules\Vtiger\dashboards\CalendarActivitiesContents.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.5',
  'unifunc' => 'content_682e1943ce5197_63265172',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'f0f027ab8f0b2f86128874a3079b87ad64508ad1' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pilgrim-sage-sutra\\layouts\\v7\\modules\\Vtiger\\dashboards\\CalendarActivitiesContents.tpl',
      1 => 1747850160,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_682e1943ce5197_63265172 (Smarty_Internal_Template $_smarty_tpl) {
?>
<div class="dashboardWidgetData">
	<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['ACTIVITIES']->value, 'ACTIVITY', false, 'INDEX');
$_smarty_tpl->tpl_vars['ACTIVITY']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['INDEX']->value => $_smarty_tpl->tpl_vars['ACTIVITY']->value) {
$_smarty_tpl->tpl_vars['ACTIVITY']->do_else = false;
?>
	<div>
		<div class='pull-left'>
			<?php if ($_smarty_tpl->tpl_vars['ACTIVITY']->value->get('activitytype') == 'Task') {?>
                <span><i class="entryIcon vicon-task"></i></span>
			<?php } else { ?>
                <span><i class="entryIcon vicon-meeting"></i></span>
			<?php }?>
		</div>
		<div>
			<div class='pull-left'>
				<?php $_smarty_tpl->_assignInScope('PARENT_ID', $_smarty_tpl->tpl_vars['ACTIVITY']->value->get('parent_id'));?>
				<?php $_smarty_tpl->_assignInScope('CONTACT_ID', $_smarty_tpl->tpl_vars['ACTIVITY']->value->get('contact_id'));?>
				<a href="<?php echo $_smarty_tpl->tpl_vars['ACTIVITY']->value->getDetailViewUrl();?>
"><?php echo $_smarty_tpl->tpl_vars['ACTIVITY']->value->get('subject');?>
</a><?php if ($_smarty_tpl->tpl_vars['PARENT_ID']->value) {?> <?php echo vtranslate('LBL_FOR');?>
 <?php echo $_smarty_tpl->tpl_vars['ACTIVITY']->value->getDisplayValue('parent_id');
} elseif ($_smarty_tpl->tpl_vars['CONTACT_ID']->value) {?> <?php echo vtranslate('LBL_FOR');?>
 <?php echo $_smarty_tpl->tpl_vars['ACTIVITY']->value->getDisplayValue('contact_id');
}?>
			</div>
				<?php $_smarty_tpl->_assignInScope('START_DATE', $_smarty_tpl->tpl_vars['ACTIVITY']->value->get('date_start'));?>
				<?php $_smarty_tpl->_assignInScope('START_TIME', $_smarty_tpl->tpl_vars['ACTIVITY']->value->get('time_start'));?>
				
				<?php $_smarty_tpl->_assignInScope('DUE_DATE', $_smarty_tpl->tpl_vars['ACTIVITY']->value->get('due_date'));?>
				<?php $_smarty_tpl->_assignInScope('DUE_TIME', $_smarty_tpl->tpl_vars['ACTIVITY']->value->get('time_end'));?>
			<p class='pull-right muted' style='margin-top:5px;padding-right:5px;'><small title="<?php echo Vtiger_Util_Helper::formatDateTimeIntoDayString(((string)$_smarty_tpl->tpl_vars['START_DATE']->value)." ".((string)$_smarty_tpl->tpl_vars['START_TIME']->value));?>
 <?php echo vtranslate('LBL_TO');?>
 <?php echo Vtiger_Util_Helper::formatDateTimeIntoDayString(((string)$_smarty_tpl->tpl_vars['DUE_DATE']->value)." ".((string)$_smarty_tpl->tpl_vars['DUE_TIME']->value));?>
"><?php echo Vtiger_Util_Helper::formatDateDiffInStrings(((string)$_smarty_tpl->tpl_vars['START_DATE']->value)." ".((string)$_smarty_tpl->tpl_vars['START_TIME']->value));?>
</small></p>
			<div class='clearfix'></div>
		</div>
		<div class='clearfix'></div>
	</div>
	<?php
}
if ($_smarty_tpl->tpl_vars['ACTIVITY']->do_else) {
?>
		<?php if ($_smarty_tpl->tpl_vars['PAGING']->value->get('nextPageExists') != 'true') {?>
			<div class="noDataMsg">
				<?php if ($_smarty_tpl->tpl_vars['REQ']->value->get('name') == 'OverdueActivities') {?>
					<?php echo vtranslate('LBL_NO_OVERDUE_ACTIVITIES',$_smarty_tpl->tpl_vars['MODULE_NAME']->value);?>

				<?php } else { ?>
					<?php echo vtranslate('LBL_NO_SCHEDULED_ACTIVITIES',$_smarty_tpl->tpl_vars['MODULE_NAME']->value);?>

				<?php }?>
			</div>
		<?php }?>
	<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>

<?php if ($_smarty_tpl->tpl_vars['PAGING']->value->get('nextPageExists') == 'true') {?>
	<div class='pull-right' style='margin-top:5px;padding-right:5px;'>
        <a href="javascript:;" name="history_more" data-url="<?php echo $_smarty_tpl->tpl_vars['WIDGET']->value->getUrl();?>
&page=<?php echo $_smarty_tpl->tpl_vars['PAGING']->value->getNextPage();?>
"><?php echo vtranslate('LBL_MORE');?>
...</a>
	</div>
<?php }?>
</div><?php }
}
