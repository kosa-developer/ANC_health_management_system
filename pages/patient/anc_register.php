<?php
if (($_GET['type']) && ($_GET['type'] == "download_register_report")) {
    $select_client = $crypt->decode($_GET['Query']);
    header("Content-Type: application/xls");
    header("Content-Disposition: attachment; filename=ANC Register.xls");
    header("Pragma: no-cache");
    header("Expires: 0");
    
    ?>
    <?php if (DB::getInstance()->checkRows($select_client)) {
       
        ?>
       
        <table style="font-size: 15px;" border="1">
        ANC Register
                <tr>
                    <th>Serial No</th>
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
                </tr>
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

                    </tr>
                    <?php
                    $s_number++;
                }
                ?>
        </table>
        <?php
    } else {
       
        echo ' <table style="color:red;">No staff Accounts registered</table>';
    }
}?>