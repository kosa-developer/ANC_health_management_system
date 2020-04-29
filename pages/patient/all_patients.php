<!DOCTYPE html>
<html lang="en">
    <!-- BEGIN HEAD -->

    <head>
        <?php include_once 'includes/header_css.php'; ?>
    </head>
    <!-- END HEAD -->
    <body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-blue">
        <div class="page-wrapper">
            <!-- start header -->
            <?php include_once 'includes/header_menu.php'; ?>
            <!-- end header -->
            <!-- start page container -->
            <div class="page-container">
                <!-- start sidebar menu -->
                <?php include_once 'includes/side_menu.php'; ?>
                <!-- end sidebar menu -->
                <!-- start page content -->
                <div class="page-content-wrapper">
                    <div class="page-content">
                        <div class="page-bar">
                            <div class="page-title-breadcrumb">
                                <div class=" pull-left">
                                    <div class="page-title">ANC Register</div>
                                </div>
                                <div class="actions panel_actions pull-right">
                                    <a class="btn btn-primary" href="index.php?page=<?php echo $crypt->encode("register_patient"); ?>"><i class="fa fa-plus"></i> Register Client</a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card card-topline-yellow">
                                    <div class="card-head">
                                        <header>List of all registered users</header>
                                    </div>
                                    <div class="card-body ">
                                        <?php
                                        if (Input::get("edituserButton") == "edituserButton") {
                                            $client_type = strtoupper(Input::get("user_type"));
                                            $client_id = Input::get("user_id");
                                            $queryUpdateSubject = DB::getInstance()->update('account', $client_id, array('User_Type' => $client_type), 'Account_Id');
                                            if ($queryUpdateSubject) {
                                                echo'<div class="alert alert-success"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Account updated successfully</strong></div>';
                                            } else {
                                                echo '<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Error in updating the Account</strong></div>';
                                            }
                                            Redirect::go_to("index.php?page=" . $crypt->encode("add_account"));
                                        }
                                        if (Input::get("deactivate")) {
                                            $client_id = Input::get("deactivate");
                                            $queryUpdateSubject = DB::getInstance()->update('account', $client_id, array('Status' => 0), 'Account_Id');
                                            if ($queryUpdateSubject) {
                                                echo'<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Account Deactivated</strong></div>';
                                            } else {
                                                echo '<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Error in updating the Account</strong></div>';
                                            }
                                            Redirect::go_to("index.php?page=" . $crypt->encode("add_account"));
                                        }
                                        if (Input::get("activate")) {
                                            $client_id = Input::get("activate");
                                            $queryUpdateSubject = DB::getInstance()->update('account', $client_id, array('Status' => 1), 'Account_Id');
                                            if ($queryUpdateSubject) {
                                                echo'<div class="alert alert-success"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Account Activates</strong></div>';
                                            } else {
                                                echo '<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Error in updating the Account</strong></div>';
                                            }
                                            Redirect::go_to("index.php?page=" . $crypt->encode("add_account"));
                                        }


                                        $select_client = "SELECT * FROM antenatal   ORDER BY Antenatal_Id desc";
                                        if (DB::getInstance()->checkRows($select_client)) {
                                            ?>
                                            <a class="btn btn-success btn-xs pull-right" href="index.php?page=<?php echo $crypt->encode("anc_register") . "&type=download_register_report&Query=" . $crypt->encode($select_client); ?>"><i class="fa fa-download">Download  Register</i> </a>

                                            <table id="example1" class="table table-bordered table-striped">
                                                <thead>
                                                    <tr><th>Serial No</th>
                                                        <th>Client No</th>
                                                        <th>Client Name</th>
                                                        <th>Parish</th>
                                                        <th>Village</th>
                                                        <th>Phone</th>
                                                        <th>Age</th>
                                                        <th>ANC Visit Days</th>
                                                        <th>Gravida</th>
                                                        <th>Parity</th>
                                                        <th>Gestational Age</th>
                                                        <th>ANC Timing</th>
                                                        <th>EDD</th>
                                                        <th>Weight</th>
                                                        <th>Height</th>
                                                        <th>MUAC</th>
                                                        <th>INR No</th>
                                                        <th>Blood Pressure</th>
                                                        <th>EMTCT Code (W)</th>
                                                        <th>EMTCT Code (P)</th>
                                                        <th>Diagnosis</th>
                                                        <th>WHO Clinical Stage No</th>
                                                        <th>CD4</th>
                                                        <th>Viral Load</th>
                                                        <th>ARVS drugs</th>
                                                        <th>Pre-ART No. of Client</th>
                                                        <th>TB Status</th>
                                                        <th>Haemoglobin</th>
                                                        <th>Syphilis test results(W)</th>
                                                        <th>Syphilis test results(P)</th>
                                                        <th>FP Counseling</th>
                                                        <th>Tetanus</th>
                                                        <th>IPT/CTX</th>
                                                        <th>Free LLIN</th>
                                                        <th>Mebendazole</th>
                                                        <th>Ferous</th>
                                                        <th>Folic</th>
                                                        <th>Other Treatment</th>
                                                        <th>Referral In</th>
                                                        <th>Referral Out</th>
                                                        <th>Risk Factors</th>
                                                        <th>Mariestopes Voucher</th>
                                                        <!--<th>Edit</th>-->

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                    $client_list = DB::getInstance()->query($select_client);
                                                    foreach ($client_list->results() as $client) {
                                                        $parish = ($client->ParishId != '') ? DB::getInstance()->displayTableColumnValue("select ParishName from parishes where ParishId='$client->ParishId'", "ParishName") : "";
                                                        $village = ($client->VillageId != '') ? DB::getInstance()->displayTableColumnValue("select VillageName from village where VillageId='$client->VillageId'", "VillageName") : "";
                                                        ?>
                                                        <tr>
                                                            <td><?php echo $client->S_No; ?></td>
                                                            <td><?php echo $client->Client_Number; ?></td>
                                                            <td><?php echo $client->Client_Name; ?></td>
                                                            <td><?php echo $parish; ?></td>
                                                            <td><?php echo $village; ?></td>
                                                            <td><?php echo $client->Phone; ?></td>
                                                            <td><?php echo $client->Age; ?></td>
                                                            <td><?php echo $client->Vist_Days; ?></td>
                                                            <td><?php echo $client->Gravida; ?></td>
                                                            <td><?php echo $client->Parity; ?></td>
                                                            <td><?php echo $client->Gestation_age; ?></td>
                                                            <td><?php echo $client->ANC_Timing; ?></td>
                                                            <td><?php echo $client->EDD; ?></td>
                                                            <td><?php echo $client->WEIGHT; ?></td>
                                                            <td><?php echo $client->HEIGHT; ?></td>
                                                            <td><?php echo $client->MUAC; ?></td>
                                                            <td><?php echo $client->INR_NO; ?></td>
                                                            <td><?php echo $client->Blood_Pressure; ?></td>
                                                            <td><?php echo $client->Emtct_Codes_W; ?></td>
                                                            <td><?php echo $client->Emtct_Codes_P; ?></td>
                                                            <td><?php echo $client->Diagnosis; ?></td>
                                                            <td><?php echo $client->Clinical_Stages; ?></td>
                                                            <td><?php echo $client->CD4; ?></td>
                                                            <td><?php echo $client->Viral_Load; ?></td>
                                                            <td><?php echo $client->Arvs_Drugs; ?></td>
                                                            <td><?php echo $client->Pre_Art; ?></td>
                                                            <td><?php echo $client->Tb_Status; ?></td>
                                                            <td><?php echo $client->Haemoglobin; ?></td>
                                                            <td><?php echo $client->Syphilis_Test_W; ?></td>
                                                            <td><?php echo $client->Syphilis_Test_P; ?></td>
                                                            <td><?php echo $client->FPC; ?></td>
                                                            <td><?php echo $client->TT_Doses; ?></td>
                                                            <td><?php echo $client->IPT; ?></td>
                                                            <td><?php echo $client->Free_Llin; ?></td>
                                                            <td><?php echo $client->Mebendazole; ?></td>
                                                            <td><?php echo $client->Ferous; ?></td>
                                                            <td><?php echo $client->Folic; ?></td>
                                                            <td><?php echo $client->Other_treatment; ?></td>
                                                            <td><?php echo $client->Referral_In; ?></td>
                                                            <td><?php echo $client->Referral_Out; ?></td>
                                                            <td><?php echo $client->Risk_Factors; ?></td>
                                                            <td><?php echo $client->Mariestopes_vourcher; ?></td>
                                                            <!--
                                                            <td>
                                                                <a data-toggle='modal'href="#modal-form<?php echo $client->Antenatal_Id; ?>" class='fa fa-pencil-square-o'></a>

                                                            </td>-->

                                                        </tr>
                                                    <div class="modal fade bs-modal-lg" id="modal-form<?php echo $client->Antenatal_Id; ?>" tabindex="-1" role="dialog" aria-hidden="true">
                                                        <div class="modal-dialog modal-lg">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h4 class="modal-title">Editing data for <?php echo $client->Client_Name; ?></h4>
                                                                </div>
                                                                <form role="form" action="" method="POST">
                                                                    <div class="modal-body">
                                                                        <div class="col-lg-3 col-md-6">
                                                                            <div class="form-group">
                                                                                <label>S/no</label>
                                                                                <input type="text" value="<?php echo $client->S_No; ?>" class="form-control" name="s_no" value=""   required>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Client number</label>
                                                                                <input type="text" name="client_number" value="<?php echo $client->Client_Number; ?>" class="form-control" >
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Name of the client</label>
                                                                                <input type="text" name="patiet_name" value="<?php echo $client->Client_Name; ?>" class="form-control" >
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Subcounty:</label>
                                                                                <select name="subcounty_id" class="select2" onchange="returnParish(this.value, 'selectedData')" >
                                                                                    <?php
                                                                                    echo DB::getInstance()->dropDowns('subcounty', 'SubcountyId', 'SubcountyName');
                                                                                    ?>
                                                                                </select>
                                                                            </div>
                                                                            <div id="selectedData" class="form-group">
                                                                            </div>
                                                                            <div id="villageData" class="form-group">
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Phone:</label>
                                                                                <input type="text" name="phone" class="form-control" >
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Age:</label>
                                                                                <input type="number" step="0.0" name="age" class="form-control" >
                                                                            </div>

                                                                            <div class="form-group">
                                                                                <label>Gravida</label>
                                                                                <input type="text" class="form-control" name="gravida" >
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Parity</label>
                                                                                <input type="text" class="form-control" name="parity" >
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label class="form-group">Anc vist days (1st, 2nd3rd )</label><br/>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="visit" value="1st" >1st
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="2nd" name="visit"  >2nd
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="3rd" name="visit" >3rd
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="4th" name="visit" >4th
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="more than 4" name="visit" >more than 4
                                                                                </label>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Gestational age (weeks)</label>
                                                                                <input type="number" max="40"class="form-control" name="Gestational" placeholder="enter Gestational age in weeks" >
                                                                            </div>

                                                                            <div class="form-group">
                                                                                <label>ANC1 Timing</label>
                                                                                <input type="text" class="form-control" name="anc_timing" placeholder="enter ANC1 Timing" >
                                                                            </div>

                                                                            <div class="form-group">
                                                                                <label>EDD:</label>
                                                                                <input name="EDD" class="form-control" >
                                                                            </div>


                                                                        </div>

                                                                        <!--2nd div-->
                                                                        <div class="col-lg-3 col-md-6">
                                                                            <div class="form-group">
                                                                                <label>Weight:</label>
                                                                                <input type="number" name="weight" class="form-control" >
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Height:</label>
                                                                                <input type="number" name="height" class="form-control" >
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>MUAC:</label>
                                                                                <input name="muac" class="form-control" >
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>INR NO:</label>
                                                                                <input name="inr_no" class="form-control" >
                                                                            </div>

                                                                            <div class="form-group">
                                                                                <label>Blood Pressure:</label>
                                                                                <input name="blood_pressure" class="form-control" >
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <fieldset style="border: 1px groove #ddd !important;
                                                                                          padding: 0 1.4em 1.4em 1.4em !important;
                                                                                          margin: 0 0 1.5em 0 !important;
                                                                                          -webkit-box-shadow:  0px 0px 0px 0px #000;
                                                                                          box-shadow:  0px 0px 0px 0px #000;">
                                                                                    <legend class="scheduler-border">emtct codes(w)</legend>

                                                                                    <div class="form-group">
                                                                                        <label>W</label><br>
                                                                                        <label class="radio-inline">
                                                                                            <input type="radio" name="w_emtc" value="TR" onclick="test_positive('negative');" >Negative
                                                                                        </label>
                                                                                        <label class="radio-inline">
                                                                                            <input type="radio" name="w_emtc" value="TRR" onclick="test_positive('positive');" >Positive
                                                                                        </label>
                                                                                        <label class="radio-inline">
                                                                                            <input type="radio" name="w_emtc" onclick="test_positive('negative');" value="TRK" >Known Negative
                                                                                        </label>
                                                                                        <label class="radio-inline">
                                                                                            <input type="radio" name="w_emtc" onclick="test_positive('positive');" value="TRRK" >Known Positive
                                                                                        </label>
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <label >P</label><br>
                                                                                        <label class="radio-inline">
                                                                                            <input type="radio" name="p_emtc" value="TR" >Negative
                                                                                        </label>
                                                                                        <label class="radio-inline">
                                                                                            <input type="radio" name="p_emtc" value="TRR" >Positive
                                                                                        </label>
                                                                                        <label class="radio-inline">
                                                                                            <input type="radio" name="p_emtc" value="TRK" >Known Negative
                                                                                        </label>
                                                                                        <label class="radio-inline">
                                                                                            <input type="radio" name="p_emtc" value="TRRK" >Known Positive
                                                                                        </label>
                                                                                    </div>
                                                                                </fieldset>
                                                                            </div>

                                                                            <div class="form-group">
                                                                                <label class="form-label">Diagnosis</label>
                                                                                <textarea class="form-control" rows="5"name="diagnosis"></textarea>
                                                                            </div>

                                                                            <div class="form-group">
                                                                                <label> WHO clinical stages</label><br/>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="clinical_stages" value="1st" >1st
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="2nd" name="clinical_stages" >2nd
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="3rd" name="clinical_stages" >3rd
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="4th" name="clinical_stages" >4th
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="NA" name="clinical_stages" >NA
                                                                                </label>

                                                                            </div>

                                                                        </div>

                                                                        <!--3rd div-->
                                                                        <div class="col-lg-3 col-md-6">
                                                                            <div class="form-group">
                                                                                <label> cd4</label>
                                                                                <input type="number" class="form-control" name="cd4" >
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>viral load</label>
                                                                                <input type="number" class="form-control" name="viral_load" >
                                                                            </div>
                                                                            <div class="hidden" id="arvs">
                                                                                <div class="form-group">
                                                                                    <label>Arvs drugs no. Of client</label>
                                                                                    <input type="number" class="form-control" name="arvs" >
                                                                                </div>

                                                                                <div class="form-group">
                                                                                    <label>pre-art no. Of client</label>
                                                                                    <input type="number" class="form-control"  name="pre_art" >
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label> Infant feeding options iycf material nutrition counselling ( i y c f)</label>
                                                                                <input type="text" class="form-control" name="infant_feeding" >
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label> Tb status</label><br/>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="Postive" name="Tb_status" >Postive
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="Negative" name="Tb_status" >Negative
                                                                                </label>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Haemoglobin</label>
                                                                                <input type="text" class="form-control" name="haemoglobin" >
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <fieldset style="border: 1px groove #ddd !important;
                                                                                          padding: 0 1.4em 1.4em 1.4em !important;
                                                                                          margin: 0 0 1.5em 0 !important;
                                                                                          -webkit-box-shadow:  0px 0px 0px 0px #000;
                                                                                          box-shadow:  0px 0px 0px 0px #000;">
                                                                                    <legend class="scheduler-border">Syphilis test(w,p)</legend>
                                                                                    <div class="form-group">
                                                                                        <label>W</label><br/>
                                                                                        <label class="radio-inline">
                                                                                            <input type="radio" value="Negative" name="w_syphilis" >Negative
                                                                                        </label>
                                                                                        <label class="radio-inline">
                                                                                            <input type="radio" value="Positive" name="w_syphilis" >Positive
                                                                                        </label>
                                                                                        <label class="radio-inline">
                                                                                            <input type="radio" value="Not Tested" name="w_syphilis" >Not tested
                                                                                        </label>

                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <label>P</label><br/>
                                                                                        <label class="radio-inline">
                                                                                            <input type="radio" value="Negative" name="p_syphilis" >Negative
                                                                                        </label>
                                                                                        <label class="radio-inline">
                                                                                            <input type="radio" value="Positive" name="p_syphilis" >Positive
                                                                                        </label>
                                                                                        <label class="radio-inline">
                                                                                            <input type="radio" value="Not Tested" name="p_syphilis" >Not tested
                                                                                        </label>
                                                                                    </div>
                                                                                </fieldset>
                                                                            </div>

                                                                            <div class="form-group">
                                                                                <label> Family planning counseling:</label><br/>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="Counseled" name="fpc" >Counseled
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="Not Counseled" name="fpc" >Not Counseled
                                                                                </label>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label> TT (doses) st</label>
                                                                                <br/>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" name="Tt" value="1st" >1st
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="2nd" name="Tt" >2nd
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="3rd" name="Tt" >3rd
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="4th" name="Tt" >4th
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="not done" name="Tt" >Not done
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <!--4th div-->
                                                                        <div class="col-lg-3 col-md-6">

                                                                            <div class="form-group">
                                                                                <label>Ipt/ctx</label>
                                                                                <br/>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="1st" name="Ipt" >1st
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="2nd" name="Ipt" >2nd
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="3rd" name="Ipt" >3rd
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="4th" name="Ipt" >4th
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="5th" name="Ipt" >5th
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="6th" name="Ipt" >6th
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="NA" name="Ipt" >NA
                                                                                </label>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Free llin</label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="Yes" name="free_llin" >No
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="Yes" name="free_llin" >No
                                                                                </label>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Mebendazole</label>
                                                                                <br/>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="Yes" name="Mebendazole" >Yes
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="No" name="Mebendazole">No
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="NA" name="Mebendazole">NA
                                                                                </label>
                                                                            </div>

                                                                            <div class="form-group">
                                                                                <fieldset style="border: 1px groove #ddd !important;
                                                                                          padding: 0 1.4em 1.4em 1.4em !important;
                                                                                          margin: 0 0 1.5em 0 !important;
                                                                                          -webkit-box-shadow:  0px 0px 0px 0px #000;
                                                                                          box-shadow:  0px 0px 0px 0px #000;">
                                                                                    <legend class="scheduler-border">Iron/Folic Acid</legend>
                                                                                    <div class="form-group">
                                                                                        <label>Ferous</label> <label class="radio-inline">
                                                                                            <input type="radio" value="Yes" name="ferous">Yes
                                                                                        </label>
                                                                                        <label class="radio-inline">
                                                                                            <input type="radio" value="No" name="ferous">No
                                                                                        </label>
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <label>Folic</label>
                                                                                        <label class="radio-inline">
                                                                                            <input type="radio" value="Yes" name="Folic">Yes
                                                                                        </label>
                                                                                        <label class="radio-inline">
                                                                                            <input type="radio" value="No" name="Folic">No
                                                                                        </label>
                                                                                    </div>
                                                                                </fieldset>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Other treatment</label>
                                                                                <textarea class="form-control" rows="5" name="other_treatment"></textarea>   

                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Referral in</label>
                                                                                <br/>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="Postive" name="Referral_in">Yes
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="Negative" name="Referral_in">No
                                                                                </label>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Referral out</label>
                                                                                <br/>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="Postive" name="Referral_out">Yes
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="Negative" name="Referral_out">No
                                                                                </label>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Risk factors/complications</label>
                                                                                <textarea class="form-control" rows="5" name="Risk"></textarea>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label>Mariestopes Voucher</label>
                                                                                <br/>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="Yes" name="mariestopes_voucher">Yes
                                                                                </label>
                                                                                <label class="radio-inline">
                                                                                    <input type="radio" value="No" name="mariestopes_voucher">No
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <input type="hidden" name="user_id" value="<?php echo $client->Account_Id; ?>">
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                                                                        <button type="submit" name="edituserButton" value="edituserButton" class="btn btn-success">Save changes</button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                            <!-- /.modal-content -->
                                                        </div>
                                                        <!-- /.modal-dialog -->
                                                    </div>
                                                    <?php
                                                    $s_number++;
                                                }
                                                ?>
                                                </tbody>
                                            </table>
                                            <?php
                                        } else {
                                            echo '<div class="alert alert-danger">No staff Accounts registered</div>';
                                        }
                                        ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end page content -->
            </div>
            <!-- end page container -->
            <!-- start footer -->
            <?php include_once 'includes/footer.php'; ?>
            <!-- end footer -->
        </div>
        <!-- start js include path -->
        <?php include_once 'includes/footer_js.php'; ?>
       <script type="text/javascript">

            function getvillage(parish) {
                if (parish && parish != "") {
                    $.ajax({
                        type: 'POST',
                        url: 'index.php?page=<?php echo $crypt->encode("ajax_data") ?>',
                        data: 'parish_name=' + parish,
                        success: function (html) {
                            $('#villageData').html(html);
                        }
                    });
                } else {
                    $('#villageData').html('');
                }
            }

            function returnParish(subject_id, paris_data) {
                var subcounty = subject_id;
                if (subcounty && subcounty != "") {
                    $('#villageData').html('');
                    $.ajax({
                        type: 'POST',
                        url: 'index.php?page=<?php echo $crypt->encode("ajax_data") ?>',
                        data: 'class_name_model=' + subcounty,
                        success: function (html) {
                            $('#' + paris_data).html(html);

                        }
                    });
                } else {
                    $('#' + id).html('');
                }
            }
            function test_positive(emtc_results) {
                if (emtc_results != 'positive') {
                    $('#arvs').attr({"class": 'hidden'});
                } else {
                    $('#arvs').attr({"class": ''});
                }

            }
        </script>
        <!-- end js include path -->
    </body>

</html>