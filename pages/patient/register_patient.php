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
                                    <div class="page-title">ANC Registration</div>
                                </div>
                                <div class="actions panel_actions pull-right">
                                    <a class="btn btn-primary" href="index.php?page=<?php echo $crypt->encode("all_patients"); ?>"><i class="fa fa-eye"></i> View ANC Register</a>
                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-sm-12">
                                
                                <div class="card card-topline-yellow">
                                    <div class="card-head">
                                        <header>ANC entry form</header>
                                    </div>
                                    <div class="card-body " id="bar-parent">
                                        <?php 
                                        include("pages/database_communication/database_communication.php");
                                        ?>
                                        <form method="POST" action="">
                                            <!--ist div-->
                                            <div class="col-lg-3 col-md-6">
                                                <div class="form-group">
                                                    <label>S/no</label>
                                                    <input type="text" value="<?php
                                                    echo $number = DB::getInstance()->displayTableColumnValue('select S_No from antenatal order by Antenatal_Id desc limit 1', 'S_No') + 1;
                                                    ?>" class="form-control" name="s_no" value=""   required>
                                                </div>
                                                <div class="form-group">
                                                    <label>Client number</label>
                                                    <input type="text" name="client_number" class="form-control" >
                                                </div>
                                                <div class="form-group">
                                                    <label>Name of the client</label>
                                                    <input type="text" name="patiet_name" class="form-control" >
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
                                                    
                                                    <input name="EDD" type="date" class="form-control" >
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
                                            <div class="pull-right">
                                                <button type="submit" class="btn btn-success" name="submit" value="submit">Submit<i class="fa fa-check"></i></button>
                                                <button type="reset" class="btn btn-default"><i class="fa fa-times"></i></button>
                                            </div>
                                        </form>
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

            function returnParish(subcounty_id, paris_data) {
                var subcounty = subcounty_id;
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
                    $('#' + paris_data).html('');
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
        <?php include_once 'includes/footer_js.php'; ?>
        <!-- end js include path -->
    </body>

</html>