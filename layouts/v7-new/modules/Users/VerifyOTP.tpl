{strip}
	<!DOCTYPE html>
	<html>
		<head>
			<title>Vtiger</title>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

			<link REL="SHORTCUT ICON" HREF="layouts/v7/skins/images/favicon.ico">
			<link rel="stylesheet" href="libraries/bootstrap-legacy/css/bootstrap.min.css" type="text/css" media="screen" />
			<link rel="stylesheet" href="resources/styles.css" type="text/css" media="screen" />
			<link rel="stylesheet" href="libraries/jquery/select2/select2.css" />
			<link rel="stylesheet" href="libraries/jquery/posabsolute-jQuery-Validation-Engine/css/validationEngine.jquery.css" />

			<script type="text/javascript" src="libraries/jquery/jquery.min.js"></script>
			<script type="text/javascript" src="layouts/v7/lib/jquery/jquery-migrate-1.4.1.js"></script>
			<script type="text/javascript" src="libraries/bootstrap/js/bootstrap.min.js"></script>
			<script type="text/javascript" src="libraries/jquery/select2/select2.min.js"></script>
			<script type="text/javascript" src="libraries/jquery/posabsolute-jQuery-Validation-Engine/js/jquery.validationEngine.js" ></script>
			<script type="text/javascript" src="libraries/jquery/posabsolute-jQuery-Validation-Engine/js/jquery.validationEngine-en.js" ></script>
            
            <style>
                
                body {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    width: 100%;
                    height: 100dvh;
                }
                .v-otp-container {
                    max-width: 350px;
                    text-align: center;
                    background-color: #f1f1f1;
                    padding: 30px;
                    border-radius: 5px;
                }
                .otp-input-inputs {
                    display: flex;
                    gap: 4px;
                    margin-top: 30px;
                    margin-bottom: 30px;
                }
                .otp-input-group .otp-digit {
                    width: 36px;
                    height: 36px;
                    text-align: center;
                    font-size: 28px;
                }
                .submit-btn-group {
                    /*margin-top: 30px;*/
                }
            </style>
        </head>
        <body>
            <div class="v-otp-container">
                <h4>Two-Factor Authentication</h4>
                <p class="text-muted">Enter the 6-digit OTP sent to your email</p>

                <form id="otpForm" method="POST" action="index.php">

                    <input type="hidden" name="module" value="Users">
                    <input type="hidden" name="action" value="VerifyOTP">

                    <div class="otp-input-group">
                        <div id="otpInputs" class="otp-input-inputs">
                            <input type="text" name="otp1" maxlength="1" class="otp-digit form-control input-lg" required>
                            <input type="text" name="otp2" maxlength="1" class="otp-digit form-control input-lg" required>
                            <input type="text" name="otp3" maxlength="1" class="otp-digit form-control input-lg" required>
                            <input type="text" name="otp4" maxlength="1" class="otp-digit form-control input-lg" required>
                            <input type="text" name="otp5" maxlength="1" class="otp-digit form-control input-lg" required>
                            <input type="text" name="otp6" maxlength="1" class="otp-digit form-control input-lg" required>
                        </div>
                    </div>

                    <input type="hidden" id="otp" name="otp" value="">

                    {if $OTP_ERROR neq ''}
                        <div id="otpError" class="alert alert-danger" role="alert">
                            {$OTP_ERROR}
                        </div>
                    {else}
                        <div id="otpError" class="alert alert-danger hide" role="alert"></div>
                    {/if}


                    <div class="submit-btn-group">
                        <button type="submit" class="btn btn-success btn-block btn-lg">Verify OTP</button>
                    </div>
                </form>
            </div>
            
            <script>
            {literal}
                jQuery(document).ready(function () {
                    const inputs = jQuery('.otp-digit');
                    const hiddenOtp = jQuery('#otp');
                    const errorDiv = jQuery('#otpError');

                    inputs[0].focus();

                    inputs.on('input', function () {
                        this.value = this.value.replace(/[^0-9]/g, '');
                        const index = inputs.index(this);
                        if (this.value && index < inputs.length - 1) {
                            inputs[index + 1].focus();
                        }
                        collectOTP();
                    });

                    inputs.on('keydown', function (e) {
                        const index = inputs.index(this);
                        if (e.key === 'Backspace' && !this.value && index > 0) {
                            inputs[index - 1].focus();
                        }
                    });

                    function collectOTP() {
                        let otp = '';
                        inputs.each(function () {
                            otp += jQuery(this).val();
                        });
                        hiddenOtp.val(otp);
                    }

                    jQuery('#otpForm').on('submit', function (e) {
                        collectOTP();
                        if (hiddenOtp.val().length !== 6) {
                            e.preventDefault();
                            errorDiv.text("Please enter a valid 6-digit OTP.");
                            errorDiv.removeClass('hide');
                        } else {
                            errorDiv.addClass('hide');
                        }
                    });
                });
            {/literal}
            </script>
        </body>
    </html>
{/strip}