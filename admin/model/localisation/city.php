<?php
class ModelLocalisationCity extends Model {
	public function addCity($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "city SET name = '" . $this->db->escape($data['name']) . "', zone_id = '" . (int)$data['zone_id'] . "', status = '" . (int)$data['status'] . "'");

		$this->cache->delete('city');
	}

	public function editCity($city_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "city SET name = '" . $this->db->escape($data['name']) . "', zone_id = '" . (int)$data['zone_id'] . "', status = '" . (int)$data['status'] . "' WHERE city_id = '" . (int)$city_id . "'");

		$this->cache->delete('city');
	}

	public function deleteCity($city_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "city WHERE city_id = '" . (int)$city_id . "'");

		$this->cache->delete('city');
	}

	public function getCity($city_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "city WHERE city_id = '" . (int)$city_id . "'");

		return $query->row;
	}

	public function getCities($data = array()) {
		$city_data = '';

		if ($data) {
			$sql = "SELECT c.city_id AS city_id, c.zone_id AS zone_id, c.name AS name, c.status AS status, (SELECT name FROM " . DB_PREFIX . "zone z WHERE z.zone_id = c.zone_id AND z.status = '1') AS zone FROM " . DB_PREFIX . "city c";

			$sort_data = array(
				'name',
				'zone'
			);

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY zone";
			}

			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}

			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}

				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}

			$query = $this->db->query($sql);

			return $query->rows;
		} else {
			$city_data = $this->cache->get('city');

			if (!$city_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "city ORDER BY name ASC");

				$city_data = $query->rows;

				$this->cache->set('city', $city_data);
			}

			return $city_data;
		}
	}

	public function getCitiesByZoneId($zone_id) {
		$city_data = $this->cache->get('city.' . (int)$zone_id);

		if (!$city_data) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "city WHERE zone_id = '" . (int)$zone_id . "' AND status = '1' ORDER BY name");

			$city_data = $query->rows;

			$this->cache->set('city.' . (int)$zone_id, $city_data);
		}

		return $city_data;
	}

	public function getTotalCities() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "city");

		return $query->row['total'];
	}

	public function checkDatabase() {
		// Cities
		$query = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "city'");

		if (!$query->num_rows) {
			$this->db->query("CREATE TABLE `" . DB_PREFIX . "city` (`city_id` int(11) NOT NULL AUTO_INCREMENT, `zone_id` int(11) NOT NULL, `name` varchar(128) NOT NULL, `status` tinyint(1) NOT NULL DEFAULT '1', `sort_order` int(3) NOT NULL DEFAULT '0', PRIMARY KEY (`city_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;");

			$this->db->query(
				"INSERT INTO `" . DB_PREFIX . "city` (`zone_id`, `name`, `status`) VALUES
				(1, 'test', 1),
				(2, 'test2', 1);"
			);
		}
/*
		// Kepulauan Riau zone
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE name = 'Kepulauan Riau'");

		if ($query->num_rows) {
			$kep_riau_id = $query->row['zone_id'];
		} else {
			$this->db->query("INSERT INTO " . DB_PREFIX . "zone SET status = '1', name = 'Kepulauan Riau', code = 'KR', country_id = '100'");

			$kep_riau_id = $this->db->getLastId();
		}

		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "city` WHERE zone_id = '" . (int)$kep_riau_id . "'");

		if (!$query->num_rows) {
			$this->db->query(
				"INSERT INTO `" . DB_PREFIX . "city` (`zone_id`, `name`, `status`) VALUES
				(" . $kep_riau_id . ", 'Kab. Karimun', 1),
				(" . $kep_riau_id . ", 'Kab. Bintan (Kep. Riau)', 1),
				(" . $kep_riau_id . ", 'Kab. Lingga', 1),
				(" . $kep_riau_id . ", 'Kab. Natuna', 1),
				(" . $kep_riau_id . ", 'Kab. Kepulauan Anambas', 1),
				(" . $kep_riau_id . ", 'Tanjungpinang', 1),
				(" . $kep_riau_id . ", 'Batam', 1);"
			);
		}

		// Papua Barat zone
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE name = 'Papua Barat'");

		if ($query->num_rows) {
			$papua_barat_id = $query->row['zone_id'];
		} else {
			$this->db->query("INSERT INTO `" . DB_PREFIX . "zone` SET status = '1', name = 'Papua Barat', code = 'PB', country_id = '100'");

			$papua_barat_id = $this->db->getLastId();
		}

		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "city` WHERE zone_id = '" . (int)$papua_barat_id . "'");

		if (!$query->num_rows) {
			$this->db->query(
				"INSERT INTO `" . DB_PREFIX . "city` (`zone_id`, `name`, `status`) VALUES
				(" . $papua_barat_id . ", 'Kab. Fak-Fak', 1),
				(" . $papua_barat_id . ", 'Kab. Kaimana', 1),
				(" . $papua_barat_id . ", 'Kab. Kepulauan Raja Ampat', 1),
				(" . $papua_barat_id . ", 'Kab. Manokwari', 1),
				(" . $papua_barat_id . ", 'Kab. Manokwari Selatan', 1),
				(" . $papua_barat_id . ", 'Kab. Pegunungan Arfak', 1),
				(" . $papua_barat_id . ", 'Kab. Sorong Selatan', 1),
				(" . $papua_barat_id . ", 'Kab. Teluk Bintuni', 1),
				(" . $papua_barat_id . ", 'Kab. Sorong', 1),
				(" . $papua_barat_id . ", 'Kab. Teluk Wondama', 1),
				(" . $papua_barat_id . ", 'Kab. Tambrauw', 0),
				(" . $papua_barat_id . ", 'Kab. Maibrat', 0),
				(" . $papua_barat_id . ", 'Sorong', 1);"
			);
		}

		// Kalimantan Utara zone
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE name = 'Kalimantan Utara'");

		if ($query->num_rows) {
			$kal_utara_id = $query->row['zone_id'];
		} else {
			$this->db->query("INSERT INTO `" . DB_PREFIX . "zone` SET status = '1', name = 'Kalimantan Utara', code = 'PB', country_id = '100'");

			$kal_utara_id = $this->db->getLastId();
		}

		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "city` WHERE zone_id = '" . (int)$kal_utara_id . "'");

		if (!$query->num_rows) {
			$this->db->query(
				"INSERT INTO `" . DB_PREFIX . "city` (`zone_id`, `name`, `status`) VALUES
				(" . $kal_utara_id . ", 'Kab. Bulungan', 1),
				(" . $kal_utara_id . ", 'Kab. Malinau', 1),
				(" . $kal_utara_id . ", 'Kab. Nunukan', 1),
				(" . $kal_utara_id . ", 'Kab. Tanah Tidung', 1),
				(" . $kal_utara_id . ", 'Tarakan', 1);"
			);
		}

		// Sulawesi Barat zone
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE name = 'Sulawesi Barat'");

		if ($query->num_rows) {
			$sul_barat_id = $query->row['zone_id'];
		} else {
			$this->db->query("INSERT INTO `" . DB_PREFIX . "zone` SET status = '1', name = 'Sulawesi Barat', code = 'SR', country_id = '100'");

			$sul_barat_id = $this->db->getLastId();
		}

		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "city` WHERE zone_id = '" . (int)$sul_barat_id . "'");

		if (!$query->num_rows) {
			$this->db->query(
				"INSERT INTO `" . DB_PREFIX . "city` (`zone_id`, `name`, `status`) VALUES
				(" . $sul_barat_id . ", 'Kab. Mamaju', 1),
				(" . $sul_barat_id . ", 'Kab. Majene', 1),
				(" . $sul_barat_id . ", 'Kab. Mamuju Utara', 1),
				(" . $sul_barat_id . ", 'Kab. Mamasa', 1),
				(" . $sul_barat_id . ", 'Kab. Polewali Mandar', 1);"
			);
		}
		*/
	}
}
?>