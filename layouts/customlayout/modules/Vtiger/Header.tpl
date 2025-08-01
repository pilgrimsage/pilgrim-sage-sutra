{*+**********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.1
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is: vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ************************************************************************************}
 {* DEBUG: Custom Layout Header Loaded *}

{strip}
<!DOCTYPE html>
<html>
	<head>
		<title>{vtranslate($PAGETITLE, $QUALIFIED_MODULE)}</title>
        <link rel="SHORTCUT ICON" href="layouts/customlayout/skins/images/favicon.ico">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <!-- Bootstrap 5 -->
        <link rel="stylesheet" href='{vresource_url("layouts/customlayout/resources/bootstrap5/bootstrap.min.css")}'>
        <link rel="stylesheet" href='{vresource_url("layouts/customlayout/resources/bootstrap5/custom.css")}'>

		<link type='text/css' rel='stylesheet' href='{vresource_url("layouts/customlayout/lib/font-awesome/css/font-awesome.min.css")}'>
        <link type='text/css' rel='stylesheet' href='{vresource_url("layouts/customlayout/lib/jquery/select2/select2.css")}'>
        <link type='text/css' rel='stylesheet' href='{vresource_url("layouts/customlayout/lib/select2-bootstrap/select2-bootstrap.css")}'>
        <link type='text/css' rel='stylesheet' href='{vresource_url("layouts/customlayout/lib/jquery/jquery-ui-1.12.0.custom/jquery-ui.css")}'>
        <link type='text/css' rel='stylesheet' href='{vresource_url("layouts/customlayout/lib/vt-icons/style.css")}'>
        <link type='text/css' rel='stylesheet' href='{vresource_url("layouts/customlayout/lib/animate/animate.min.css")}'>
        <link type='text/css' rel='stylesheet' href='{vresource_url("layouts/customlayout/lib/jquery/malihu-custom-scrollbar/jquery.mCustomScrollbar.css")}'>
        <link type='text/css' rel='stylesheet' href='{vresource_url("layouts/customlayout/lib/jquery/jquery.qtip.custom/jquery.qtip.css")}'>
        <link type='text/css' rel='stylesheet' href='{vresource_url("layouts/customlayout/lib/jquery/daterangepicker/daterangepicker.css")}'>
        
        <input type="hidden" id="inventoryModules" value={ZEND_JSON::encode($INVENTORY_MODULES)}>
        {if isset($SELECTED_MENU_CATEGORY)}
        {assign var=V7_THEME_PATH value=Vtiger_Theme::getv7AppStylePath($SELECTED_MENU_CATEGORY)}
        {/if}
        {if strpos($V7_THEME_PATH,".less")!== false}
            <link type="text/css" rel="stylesheet/less" href="{vresource_url($V7_THEME_PATH)}" media="screen" />
        {else}
            <link type="text/css" rel="stylesheet" href="{vresource_url($V7_THEME_PATH)}" media="screen" />
        {/if}
        
        {foreach key=index item=cssModel from=$STYLES}
			<link type="text/css" rel="{$cssModel->getRel()}" href="{vresource_url($cssModel->getHref())}" media="{$cssModel->getMedia()}" />
		{/foreach}

		{* For making pages - print friendly *}
		<style type="text/css">
            @media print {
            .noprint { display:none; }
		}
		</style>
		<script type="text/javascript">var __pageCreationTime = (new Date()).getTime();</script>
		<script src="{vresource_url('layouts/customlayout/lib/jquery/jquery.min.js')}"></script>
		<script src="{vresource_url('layouts/customlayout/lib/jquery/jquery-migrate-1.4.1.js')}"></script>

        <script src="{vresource_url('layouts/customlayout/resources/bootstrap5/bootstrap.bundle.min.js')}"></script>
        <script src="{vresource_url('layouts/customlayout/resources/bootstrap5/custom.js')}"></script>

		<script type="text/javascript">
			var _META = { 'module': "{$MODULE}", view: "{$VIEW}", 'parent': "{$PARENT_MODULE}", 'notifier':"{$NOTIFIER_URL}", 'app':"{if isset($SELECTED_MENU_CATEGORY)} {$SELECTED_MENU_CATEGORY}{/if}" };
            {if $EXTENSION_MODULE}
                var _EXTENSIONMETA = { 'module': "{$EXTENSION_MODULE}", view: "{$EXTENSION_VIEW}"};
            {/if}
            var _USERMETA;
            {if $CURRENT_USER_MODEL}
               _USERMETA =  { 'id' : "{$CURRENT_USER_MODEL->get('id')}", 'menustatus' : "{$CURRENT_USER_MODEL->get('leftpanelhide')}", 
                              'currency' : "{decode_html($USER_CURRENCY_SYMBOL)}", 'currencySymbolPlacement' : "{$CURRENT_USER_MODEL->get('currency_symbol_placement')}",
                          'currencyGroupingPattern' : "{$CURRENT_USER_MODEL->get('currency_grouping_pattern')}", 'truncateTrailingZeros' : "{$CURRENT_USER_MODEL->get('truncate_trailing_zeros')}",'userlabel':"{($CURRENT_USER_MODEL->get('userlabel'))|escape:html}",};
            {/if}
		</script>
	</head>
	 {assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
	<body data-skinpath="{Vtiger_Theme::getBaseThemePath()}" data-language="{$LANGUAGE}" data-user-decimalseparator="{$CURRENT_USER_MODEL->get('currency_decimal_separator')}" data-user-dateformat="{$CURRENT_USER_MODEL->get('date_format')}"
          data-user-groupingseparator="{$CURRENT_USER_MODEL->get('currency_grouping_separator')}" data-user-numberofdecimals="{$CURRENT_USER_MODEL->get('no_of_currency_decimals')}" data-user-hourformat="{$CURRENT_USER_MODEL->get('hour_format')}"
          data-user-calendar-reminder-interval="{$CURRENT_USER_MODEL->getCurrentUserActivityReminderInSeconds()}">
            <input type="hidden" id="start_day" value="{$CURRENT_USER_MODEL->get('dayoftheweek')}" /> 
		<div id="page">
            <div id="pjaxContainer" class="hide noprint"></div>
            <div id="messageBar" class="hide"></div>
