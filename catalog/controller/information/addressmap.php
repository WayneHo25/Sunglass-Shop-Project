<?php
class ControllerInformationAddressmap extends Controller {
	public function index() {
		
		$data['ak'] = $this->config->get('config_geocode');

		$data['address'] = nl2br($this->config->get('config_address'));
		
		$data['storeNname'] = $this->config->get('config_name');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/addressmap.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/information/addressmap.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/information/addressmap.tpl', $data));
		}
	}
}