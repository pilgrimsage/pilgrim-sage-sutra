<?php
class Users_VerifyOTP_Action extends Vtiger_Action_Controller {

    public function checkPermission(Vtiger_Request $request) {
        return true;
    }

    public function loginRequired() {
        return false;
    }

    public function process(Vtiger_Request $request) {
        session_start();
    
        $userId    = $_SESSION['otp_user_id'] ?? null;
        $otpHash   = $_SESSION['otp_hash'] ?? null;
        $attempts  = $_SESSION['otp_attempts'] ?? 0;
        $expiresAt = $_SESSION['otp_expires'] ?? 0;
    
        if (!$userId || !$otpHash || time() > $expiresAt || $attempts >= 2) {
            session_unset();
            $_SESSION['otp_error'] = 'Session expired or too many attempts. Please try again.';
            header("Location: index.php");
            exit;
        }
    
        $inputOtp = $request->get('otp');
    
        if (password_verify($inputOtp, $otpHash)) {
            // Success
            $_SESSION['authenticated_user_id'] = $userId;
            Vtiger_Session::set('AUTHUSERID', $userId);
            $_SESSION['app_unique_key'] = vglobal('application_unique_key');
            $_SESSION['authenticated_user_language'] = vglobal('default_language');
            $_SESSION['authenticated_user_skin'] = $request->get('skin');
    
            session_regenerate_id(true);
            unset($_SESSION['otp_user_id'], $_SESSION['otp_hash'], $_SESSION['otp_attempts'], $_SESSION['otp_expires'], $_SESSION['otp_error']);
    
            header("Location: index.php");
            exit;
        } else {
            $_SESSION['otp_attempts']++;
            $_SESSION['otp_error'] = 'Invalid OTP. Attempts left: ' . (3 - $_SESSION['otp_attempts']);
            header("Location: index.php?module=Users&view=VerifyOTP");
            exit;
        }
    }
    
}
