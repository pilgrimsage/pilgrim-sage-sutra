<?php
class Users_VerifyOTP_View extends Vtiger_Index_View {

    public function loginRequired() {
        return false;
    }

    public function checkPermission(Vtiger_Request $request) {
        return true;
    }

    public function preProcess(Vtiger_Request $request, $display = true) {
        // parent::preProcess($request, $display);
    }

    public function postProcess(Vtiger_Request $request) {
        // parent::postProcess($request);
    }

    public function process(Vtiger_Request $request) {
        $viewer = $this->getViewer($request);
        
        $error = $_SESSION['otp_error'] ?? '';
        unset($_SESSION['otp_error']);
    
        $viewer->assign('OTP_ERROR', $error);
        $viewer->view('VerifyOTP.tpl', 'Users');
    }
    
}
