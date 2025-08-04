{*+**********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version
1.1 * ("License"); You may not use this file except in compliance with the
License * The Original Code is: vtiger CRM Open Source * The Initial Developer
of the Original Code is vtiger. * Portions created by vtiger are Copyright (C)
vtiger. * All Rights Reserved.
************************************************************************************}
{* modules/Users/views/Login.php *} {strip}
<link rel="stylesheet" href="layouts/customlayout/skins/users/login.css" />
<span class="app-nav"></span>
<div class="container-fluid loginPageContainer row g-3">
  <div class="col-12 col-lg-6">
    <div class="row">
      <div class="col-md-10 mx-auto">
        <div class="loginDiv widgetHeight p-3">
          <img
            class="img-responsive img-fluid user-logo d-block mx-auto"
            src="layouts/customlayout/resources/Images/custom-logo.svg"
          />
          <div class="group top-title mb-2">
            <h2 class="login-title">
              <strong><b>Login</b></strong>
            </h2>
            <p>Access the CRM panel using your email and passcode.</p>
          </div>
          <div>
            <span
              class="{if !$OTP_ERROR}hide{/if} failureMessage"
              id="validationMessage"
              >{$OTP_ERROR}</span
            >
            <span
              class="{if !$ERROR}hide{/if} failureMessage"
              id="validationMessage"
              >{$MESSAGE}</span
            >
            <span class="{if !$MAIL_STATUS}hide{/if} successMessage"
              >{$MESSAGE}</span
            >
          </div>

          <div id="loginFormDiv">
            <form class="form-horizontal" method="POST" action="index.php">
              <input type="hidden" name="module" value="Users" />
              <input type="hidden" name="action" value="Login" />
              <div class="group">
                <input
                  class="custom-input"
                  id="username"
                  type="text"
                  name="username"
                  placeholder=""
                />
                <span class="bar"></span>
                <label>Username</label>
              </div>
              <div class="group">
                <input
                  class="custom-input"
                  id="password"
                  type="password"
                  name="password"
                  placeholder=""
                />
                <span class="bar"></span>
                <label>Password</label>
              </div>
              {assign var="CUSTOM_SKINS" value=Vtiger_Theme::getAllSkins()} {if
              !empty($CUSTOM_SKINS)}
              <div class="group" style="margin-bottom: 10px">
                <select
                  id="skin"
                  name="skin"
                  placeholder="Skin"
                  style="text-transform: capitalize; width: 100%; height: 30px"
                >
                  <option value="">Default Skin</option>
                  {foreach item=CUSTOM_SKIN from=$CUSTOM_SKINS}
                  <option value="{$CUSTOM_SKIN}">{$CUSTOM_SKIN}</option>
                  {/foreach}
                </select>
              </div>
              {/if}
              <div class="group">
                <button
                  type="submit"
                  class="bg-primary button buttonBlue rounded"
                >
                  Sign in</button
                ><br />
                <a class="forgotPasswordLink" style="color: #15c"
                  >forgot password?</a
                >
              </div>
            </form>
          </div>

          <div id="forgotPasswordDiv" class="hide">
            <form
              class="form-horizontal"
              action="forgotPassword.php"
              method="POST"
            >
              <div class="group">
                <input
                  class="custom-input"
                  id="fusername"
                  type="text"
                  name="username"
                />
                <span class="bar"></span>
                <label>Username</label>
              </div>
              <div class="group">
                <input
                  class="custom-input"
                  id="email"
                  type="email"
                  name="emailId"
                />
                <span class="bar"></span>
                <label>Email</label>
              </div>
              <div class="group">
                <button
                  type="submit"
                  class="bg-warning rounded button buttonBlue forgot-submit-btn"
                >
                  Submit</button
                ><br />
                <span
                  >Please enter details and submit<a
                    class="forgotPasswordLink pull-right"
                    style="color: #15c"
                    >Back</a
                  ></span
                >
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- <div class="col-lg-1 d-none d-xl-block">
		<div class="separatorDiv"></div>
	</div> -->
  <div class="col-lg-6 d-none d-lg-block">
    <div class="marketingDiv widgetHeight">
      <div class="scrollContainer">
        <div class="slider-div">
          <ul class="bxslider">
            <li class="slide">
              <img class="img-fluid" src="layouts/customlayout/skins/users/register-bg.jpg" />
            </li>
            <li class="slide">
              <img class="img-fluid" src="layouts/customlayout/skins/users/forgot-bg.jpg" />
            </li>
            <li class="slide">
              <img class="img-fluid" src="layouts/customlayout/skins/users/login-bg.jpg" />
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <script>
    jQuery(document).ready(function () {
      var validationMessage = jQuery("#validationMessage");
      var forgotPasswordDiv = jQuery("#forgotPasswordDiv");
      var loginFormDiv = jQuery("#loginFormDiv");
      loginFormDiv.find("#password").focus();
      loginFormDiv.find("a").click(function () {
        loginFormDiv.toggleClass("hide");
        forgotPasswordDiv.toggleClass("hide");
        validationMessage.addClass("hide");
      });
      forgotPasswordDiv.find("a").click(function () {
        loginFormDiv.toggleClass("hide");
        forgotPasswordDiv.toggleClass("hide");
        validationMessage.addClass("hide");
      });
      loginFormDiv.find("button").on("click", function () {
        var username = loginFormDiv.find("#username").val();
        var password = jQuery("#password").val();
        var result = true;
        var errorMessage = "";
        if (username === "") {
          errorMessage = "Please enter valid username";
          result = false;
        } else if (password === "") {
          errorMessage = "Please enter valid password";
          result = false;
        }
        if (errorMessage) {
          validationMessage.removeClass("hide").text(errorMessage);
        }
        return result;
      });

      forgotPasswordDiv.find("button").on("click", function () {
        var username = jQuery("#forgotPasswordDiv #fusername").val();
        var email = jQuery("#email").val();

        var email1 = email.replace(/^\s+/, "").replace(/\s+$/, "");
        var emailFilter = /^[^@]+@[^@.]+\.[^@]*\w\w$/;
        var illegalChars = /[\(\)\<\>\,\;\:\\\"\[\]]/;

        var result = true;
        var errorMessage = "";
        if (username === "") {
          errorMessage = "Please enter valid username";
          result = false;
        } else if (!emailFilter.test(email1) || email == "") {
          errorMessage = "Please enter valid email address";
          result = false;
        } else if (email.match(illegalChars)) {
          errorMessage = "The email address contains illegal characters.";
          result = false;
        }
        if (errorMessage) {
          validationMessage.removeClass("hide").text(errorMessage);
        }
        return result;
      });
      jQuery("input").blur(function (e) {
        var currentElement = jQuery(e.currentTarget);
        if (currentElement.val()) {
          currentElement.addClass("used");
        } else {
          currentElement.removeClass("used");
        }
      });

      var ripples = jQuery(".ripples");
      ripples.on("click.Ripples", function (e) {
        jQuery(e.currentTarget).addClass("is-active");
      });

      ripples.on(
        "animationend webkitAnimationEnd mozAnimationEnd oanimationend MSAnimationEnd",
        function (e) {
          jQuery(e.currentTarget).removeClass("is-active");
        }
      );
      loginFormDiv.find("#username").focus();

      var slider = jQuery(".bxslider").bxSlider({
        auto: true,
        pause: 4000,
        nextText: "",
        prevText: "",
        autoHover: true,
        page: false,
      });
      jQuery(".bx-prev, .bx-next, .bx-pager-item").live("click", function () {
        slider.startAuto();
      });
      jQuery(".bx-wrapper .bx-viewport").css("background-color", "transparent");
      jQuery(".bx-wrapper .bxslider li").css("text-align", "left");
      jQuery(".bx-wrapper .bx-pager").css("bottom", "-40px");
      jQuery(".bx-wrapper .bx-pager").css("display", "none");

      var params = {
        theme: "dark-thick",
        setHeight: "100%",
        advanced: {
          autoExpandHorizontalScroll: true,
          setTop: 0,
        },
      };
      jQuery(".scrollContainer").mCustomScrollbar(params);
    });
  </script>
</div>
{/strip}
