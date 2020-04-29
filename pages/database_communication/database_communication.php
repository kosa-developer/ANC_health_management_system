<?php

if (Input::exists() && Input::get('submit') == "submit") {

    $s_no = (Input::get('s_no') != '') ? Input::get('s_no') : NULL;
    $client_number = (Input::get('client_number') != '') ? Input::get('client_number') : NULL;
    $patiet_name = (Input::get('patiet_name') != '') ? Input::get('patiet_name') : NULL;
    $parish_id = (Input::get('parish_id') != '') ? Input::get('parish_id') : NULL;
    $village_id = (Input::get('village_id') != '') ? Input::get('village_id') : NULL;
    $phone = (Input::get('phone') != '') ? Input::get('phone') : NULL;
    $age = (Input::get('age') != '') ? Input::get('age') : NULL;
    $gravida = (Input::get('gravida') != '') ? Input::get('gravida') : NULL;
    $parity = (Input::get('parity') != '') ? Input::get('parity') : NULL;
    $visit = (Input::get('visit') != '') ? Input::get('visit') : NULL;
    $Gestational = (Input::get('Gestational') != '') ? Input::get('Gestational') : NULL;
    $anc_timing = (Input::get('anc_timing') != '') ? Input::get('anc_timing') : NULL;
    $EDD = (Input::get('EDD') != '') ? Input::get('EDD') : NULL;
    $weight = (Input::get('weight') != '') ? Input::get('weight') : NULL;
    $height = (Input::get('height') != '') ? Input::get('height') : NULL;
    $muac = (Input::get('muac') != '') ? Input::get('muac') : NULL;
    $inr_no = (Input::get('inr_no') != '') ? Input::get('inr_no') : NULL;
    $blood_pressure = (Input::get('blood_pressure') != '') ? Input::get('blood_pressure') : NULL;
    $w_emtc = (Input::get('w_emtc') != '') ? Input::get('w_emtc') : NULL;
    $p_emtc = (Input::get('p_emtc') != '') ? Input::get('p_emtc') : NULL;
    $diagnosis = (Input::get('diagnosis') != '') ? Input::get('diagnosis') : NULL;
    $clinical_stages = (Input::get('clinical_stages') != '') ? Input::get('clinical_stages') : NULL;
    $cd4 = (Input::get('cd4') != '') ? Input::get('cd4') : NULL;
    $viral_load = (Input::get('viral_load') != '') ? Input::get('viral_load') : NULL;
    $arvs = (Input::get('arvs') != '') ? Input::get('arvs') : NULL;
    $pre_art = (Input::get('pre_art') != '') ? Input::get('pre_art') : NULL;
    $infant_feeding = (Input::get('infant_feeding') != '') ? Input::get('infant_feeding') : NULL;
    $Tb_status = (Input::get('Tb_status') != '') ? Input::get('Tb_status') : NULL;
    $haemoglobin = (Input::get('haemoglobin') != '') ? Input::get('haemoglobin') : NULL;
    $w_syphilis = (Input::get('w_syphilis') != '') ? Input::get('w_syphilis') : NULL;
    $p_syphilis = (Input::get('p_syphilis') != '') ? Input::get('p_syphilis') : NULL;
    $fpc = (Input::get('fpc') != '') ? Input::get('fpc') : NULL;
    $Tt = (Input::get('Tt') != '') ? Input::get('Tt') : NULL;
    $Ipt = (Input::get('Ipt') != '') ? Input::get('Ipt') : NULL;
    $free_llin = (Input::get('free_llin') != '') ? Input::get('free_llin') : NULL;
    $Mebendazole = (Input::get('Mebendazole') != '') ? Input::get('Mebendazole') : NULL;
    $ferous = (Input::get('ferous') != '') ? Input::get('ferous') : NULL;
    $Folic = (Input::get('Folic') != '') ? Input::get('Folic') : NULL;
    $other_treatment = (Input::get('other_treatment') != '') ? Input::get('other_treatment') : NULL;
    $Referral_in = (Input::get('Referral_in') != '') ? Input::get('Referral_in') : NULL;
    $Referral_out = (Input::get('Referral_out') != '') ? Input::get('Referral_out') : NULL;
    $Risk = (Input::get('Risk') != '') ? Input::get('Risk') : NULL;
    $mariestopes_voucher = (Input::get('mariestopes_voucher') != '') ? Input::get('mariestopes_voucher') : NULL;

//                                                            Inserting patient data in the database
    $query_insert = DB::getInstance()->insert('antenatal', array(
        'S_No' => $s_no,
        'Client_Number' => $client_number,
        'Client_Name' => $patiet_name,
        'ParishId' => $parish_id,
        'VillageId' => $village_id,
        'Phone' => $phone,
        'Age' => $age,
        'ANC_Timing' => $anc_timing,
        'EDD' => $EDD,
        'WEIGHT' => $weight,
        'HEIGHT' => $height,
        'MUAC' => $muac,
        'INR_NO' => $inr_no,
        'Blood_Pressure' => $blood_pressure,
        'Gravida' => $gravida,
        'Parity' => $parity,
        'Vist_Days' => $visit,
        'Gestation_age' => $Gestational,
        'Emtct_Codes_W' => $w_emtc,
        'Emtct_Codes_P' => $p_emtc,
        'Diagnosis' => $diagnosis,
        'Clinical_Stages' => $clinical_stages,
        'CD4' => $cd4,
        'Viral_Load' => $viral_load,
        'Arvs_Drugs' => $arvs,
        'Pre_Art' => $pre_art,
        'Infant_Feeding' => $infant_feeding,
        'Tb_Status' => $Tb_status,
        'Syphilis_Test_W' => $w_syphilis,
        'Syphilis_Test_P' => $p_syphilis,
        'Ferous' => $ferous,
        'Folic' => $Folic,
        'Other_treatment' => $other_treatment,
        'FPC' => $fpc,
        'TT_Doses' => $Tt,
        'IPT' => $Ipt,
        'Free_Llin' => $free_llin,
        'Mebendazole' => $Mebendazole,
        'Referral_In' => $Referral_in,
        'Referral_Out' => $Referral_out,
        'Risk_Factors' => $Risk,
        'Haemoglobin' => $haemoglobin,
        'Mariestopes_vourcher' => $mariestopes_voucher));
    if ($query_insert) {
        $message = "Data has been successfull regestered";
        echo '<div class="alert alert-success col-sm-12"> Data has been successfull regestered</div>';
    } else {

        echo '<div class="alert alert-danger col-sm-12">There is a problem</div>';
    }

    Redirect::go_to("index.php?page=" . $crypt->encode("register_patient"));
}
?>