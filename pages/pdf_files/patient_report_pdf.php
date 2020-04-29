<?php
require ('pdf_header.php');
$pdf = new PDF();
$pdf->AliasNbPages();
if (($_GET['type']) && ($_GET['type'] == "download_patient_admission_pdf")) {
    $patient_id = Input::get('patient_id');
    $queryPatients = "SELECT * FROM patient,person WHERE person.Person_Id=patient.Person_Id AND patient.Patient_Id='$patient_id' LIMIT 1";


    $pdf->AddPage();
    $pdf->SetTextColor(180, 0, 16);
    $pdf->createHeader($hospital_main_title, 185);
    $pdf->Cell(0, 5, "PATIENT ADMISSION FACE SHEET", 0, 1, "C");
    $pdf->SetTextColor(0, 0, 0);
    $patientData = DB::getInstance()->querySample($queryPatients);
    $pdf->SetDash(0.2, 1);
    $line_height = 28;
    foreach ($patientData as $patientdata) {
        //physician and date of admission
        $pdf->SetFont("Arial", "", 8);
        $pdf->Cell(20, 7, "Physician / Surgeon:  ", 0, 0, "L");
        $pdf->Line(37, $line_height + 7, 87, $line_height + 7);
        $pdf->SetFont("Arial", "", 8);
        $pdf->Cell(60, 7, "", 0, 0, "L");
        $pdf->SetFont("Arial", "", 8);
        $pdf->Cell(10, 7, "Ward: ", 0, 0, "R");
        $pdf->SetFont("Arial", "", 8);
        $pdf->Line(98, $line_height + 7, 125, $line_height + 7);
        $pdf->Cell(25, 7, $patientdata->Ward_Assigned, 0, 0, "L");

        $pdf->SetFont("Arial", "", 8);
        $pdf->Cell(30, 7, "Admission date: ", 0, 0, "L");
        $pdf->SetFont("Arial", "", 8);
        $pdf->Line(147, $line_height + 7, 195, $line_height + 7);
        $admssion_date = DB::getInstance()->displayTableColumnValue("select Admission_Date from patient_admission where Patient_Id='$patientdata->Patient_Id' ", 'Admission_Date')." ".substr(DB::getInstance()->displayTableColumnValue("select Time from patient_admission where Patient_Id='$patientdata->Patient_Id'","Time"), 10);
        $pdf->Cell(40, 7, $admssion_date, 0, 1, "L");
     
        //names and sex
        $pdf->SetFont("Arial", "", 8);
        $pdf->Cell(30, 7, "Patient names:  ", 0, 0, "L");
        $pdf->SetFont("Arial", "", 8);
        $pdf->Line(30, $line_height + 14, 86, $line_height + 14);
        $pdf->Cell(45, 7, $patientdata->Fname . '  ' . $patientdata->Lname, 0, 0, "L");
        $pdf->SetFont("Arial", "", 8);
        $pdf->Cell(10, 7, "sex: ", 0, 0, "L");
        $pdf->SetFont("Arial", "", 8);
        $pdf->Line(93, $line_height + 14, 110, $line_height + 14);
        $pdf->Cell(15, 7, $patientdata->Gender, 0, 0, "L");
        //age
        $pdf->SetFont("Arial", "", 8);
        $pdf->Cell(15, 7, "Age: ", 0, 0, "L");
        $pdf->SetFont("Arial", "", 8);
        //calculate age
        $age = calculateAge($patientdata->DOB, $date_today);
        $pdf->Line(118, $line_height + 14, 145, $line_height + 14);
        $pdf->Cell(20, 7, $age, 0, 0, "L");
        //Gravida and parity
        if ($patientdata->Ward_Assigned == "GYNECOLOGY") {
            $pdf->SetFont("Arial", "", 8);
            $pdf->Cell(10, 7, "Gravida: ", 0, 0, "L");
            $pdf->SetFont("Arial", "", 8);
            
        $pdf->Line(157, $line_height + 14, 171, $line_height + 14);
            $pdf->Cell(15, 7, $patientdata->Gravida, 0, 0, "C");
            $pdf->SetFont("Arial", "", 8);
            $pdf->Cell(10, 7, "Parity: ", 0, 0, "L");
            $pdf->SetFont("Arial", "", 8);
            
        $pdf->Line(179, $line_height + 14, 195, $line_height + 14);
            $pdf->Cell(15, 7, $patientdata->Parity, 0, 0, "C");
        }
        $pdf->Cell(0, 7, "", 0, 1, "L");
        //National id number
        $pdf->SetFont("Arial", "", 8);
        $pdf->Cell(40, 7, "National identity no: ", 0, 0, "L");
        $pdf->SetFont("Arial", "", 8);
        $pdf->Line(36, $line_height + 21, 100, $line_height + 21);
        $pdf->Cell(50, 7, $patientdata->Identity_Card, 0, 0, "L");
        //edu
        //religion
        $pdf->SetFont("Arial", "", 8);
        $pdf->Cell(20, 7, "Religion: ", 0, 0, "L");
        $pdf->SetFont("Arial", "", 8);
        $pdf->Line(112, $line_height + 21, 195, $line_height + 21);

        $pdf->Cell(30, 7, $patientdata->Religion, 0, 1, "L");

        $pdf->SetFont("Arial", "", 8);
        $pdf->Cell(20, 7, "Education: ", 0, 0, "L");
        $pdf->SetFont("Arial", "", 8);
        $pdf->Line(24, $line_height + 28, 195, $line_height + 28);

        $pdf->Cell(30, 7, $patientdata->Education, 0, 1, "L");
        //contact address
        $pdf->SetFont("Arial", "B", 8);
        $pdf->Cell(40, 7, "CONTACT INFORMATION: ", 0, 1, "L");
        $pdf->SetFont("Arial", "", 8);
        $pdf->Cell(15, 7, "Residence:", 0, 0, "L");
        $pdf->SetFont("Arial", "", 8);
        $pdf->Line(26, $line_height + 42, 65, $line_height + 42);
        $pdf->Cell(40, 7, $patientdata->Residence, 0, 0, "L");
        $pdf->SetFont("Arial", "", 8);
        $pdf->Cell(30, 7, "Muluka/Village/Town:", 0, 0, "L");
         $pdf->SetFont("Arial", "", 8);
         
        $pdf->Line(92, $line_height + 42, 137, $line_height + 42);
        $pdf->Cell(40, 7, $patientdata->Village, 0, 0, "L");

        $pdf->SetFont("Arial", "", 8);
        $pdf->Cell(17, 7, "Sub-county:", 0, 0, "L");
        $pdf->SetFont("Arial", "", 8);
        $pdf->Line(151, $line_height + 42, 195, $line_height + 42);
        $pdf->Cell(20, 7, $patientdata->Subcounty, 0, 1, "L");
        $pdf->SetFont("Arial", "", 8);
        $pdf->Cell(15, 7, "District:", 0, 0, "L");
        $pdf->SetFont("Arial", "", 8);
         $pdf->Line(21, $line_height + 49, 105, $line_height + 49);
        $pdf->Cell(80, 7, $patientdata->District, 0, 0, "L");
        $pdf->SetFont("Arial", "", 8);
        $pdf->Cell(17, 7, "Tel number:", 0, 0, "L");
        $pdf->SetFont("Arial", "", 8);
        
         $pdf->Line(122, $line_height + 49, 195, $line_height + 49);
        $pdf->Cell(70, 7, $patientdata->Phone_Number, 0, 1, "L");

//next of kin's names, relationship and phone number
        $pdf->SetFont("Arial", "B", 8);
        $pdf->Cell(35, 7, "NEXT OF KIN INFORMATION", 0, 1, "L");
        $pdf->SetFont("Arial", "", 8);
        $pdf->Cell(10, 7, "Names:", 0, 0, "L");
        $pdf->SetFont("Arial", "", 8);
        $pdf->Line(21, $line_height + 63, 67, $line_height + 63);
        $pdf->Cell(50, 7, $patientdata->Next_Of_Kin, 0, 0, "L");
        $pdf->SetFont("Arial", "", 8);
        $pdf->Cell(15, 7, "Relationship:", 0, 0, "C");
        $pdf->SetFont("Arial", "", 8);
        $pdf->Line(86, $line_height + 63, 115, $line_height + 63);
        $pdf->Cell(30, 7, $patientdata->Next_Kin_Relationship, 0, 0, "L");
        $pdf->SetFont("Arial", "", 8);
        $pdf->Cell(15, 7, "Tel no:", 0, 0, "L");
        $pdf->SetFont("Arial", "", 8);
         $pdf->Line(125, $line_height + 63, 160, $line_height + 63);
        $pdf->Cell(30, 7, $patientdata->Next_Kin_contact, 0, 0, "L");

        $pdf->SetFont("Arial", "", 8);
        $pdf->Cell(20, 7, " Occupation ", 0, 0, "L");
        $pdf->SetFont("Arial", "", 8);
        $pdf->Line(177, $line_height + 63, 195, $line_height + 63);
        $pdf->Cell(30, 7, $patientdata->Occupation, 0, 1, "L");
        //refered by
        $pdf->SetFont("Arial", "", 8);
        $pdf->Cell(40, 7, " Reffered To ", 0, 0, "L");
        $pdf->SetFont("Arial", "", 8);
        $pdf->Line(27, $line_height + 70, 120, $line_height + 70);
        $pdf->Cell(70, 7, $patientdata->Referred_Out_Center, 0, 0, "L");
        $pdf->SetFont("Arial", "", 8);
        $pdf->Cell(40, 7, "Referred By : ", 0, 0, "L");
        $pdf->SetFont("Arial", "", 8);
         $pdf->Line(138, $line_height + 70, 195, $line_height + 70);
         $staff=DB::getInstance()->displayTableColumnValue("select Fname from person,staff where staff.Person_Id=person.Person_Id and staff.Staff_Id='$patientdata->Referred_Out_By' ", 'Fname')." ".DB::getInstance()->displayTableColumnValue("select Lname from person,staff where staff.Person_Id=person.Person_Id and staff.Staff_Id='$patientdata->Referred_Out_By' ", 'Lname');
        $pdf->Cell(40, 7,"$staff" , 0, 1, "L");

        //previous number of subsquent number of referals 
//    $pdf->SetFont("Arial", "B", 10);    
//    $pdf->Cell(40,7," Reffered To: ",0,0,"L");  
//    $pdf->Cell(150,7,"..............................",0,1,"L");
        $pdf->SetFont("Arial", "B", 10);
        $pdf->Cell(40, 7, " Ref Nos Previous and subsquent Admissions: ", 0, 0, "L");
        $pdf->Cell(150, 7, "  ", 0, 1, "L");
        $pdf->SetFont("Arial", "", 10);
         $pdf->Line(12, $line_height + 84, 195, $line_height + 84);
        $pdf->Write(7, "");
        //provisional diagnosis
        $pdf->Cell(190, 7, "  ", 0, 1, "L");
        $pdf->SetFont("Arial", "B", 10);
        $pdf->Cell(40, 7, " Provisional Diagnosis: ", 0, 0, "L");
        $pdf->Cell(150, 7, "  ", 0, 1, "L");
        $pdf->SetFont("Arial", "", 10);
        $provisional_diagnosis = "";
        $provisional_diagnosis_array = unserialize(DB::getInstance()->getName("patient_admission", $patientdata->Patient_Id, "Provisional_Diagnosis", "Patient_Id"));
        for ($i = 0; $i < count($provisional_diagnosis_array); $i++) {
            $provisional_diagnosis .= ($i != count($provisional_diagnosis_array) - 1) ? $provisional_diagnosis_array[$i] . ", " : $provisional_diagnosis_array[$i];
        }
         $pdf->Line(12, $line_height + 98, 195, $line_height + 98);
          $pdf->Line(12, $line_height + 105, 195, $line_height + 105);
           $pdf->Line(12, $line_height + 112, 195, $line_height + 112);
           
        $pdf->Write(7, $provisional_diagnosis . "        ");
        //case summary
        $pdf->Cell(190, 21, "  ", 0, 1, "L");
        $pdf->SetFont("Arial", "B", 10);
        $pdf->Cell(40, 7, " Case Summary: ", 0, 0, "L");
        $pdf->Cell(150, 7, "  ", 0, 1, "L");
        $pdf->SetFont("Arial", "", 10);
        $pdf->Line(12, $line_height + 126, 195, $line_height + 126);
          $pdf->Line(12, $line_height + 133, 195, $line_height + 133);
        $pdf->Write(7, "");
        //final diagnosis 
        $pdf->Cell(190, 14, "  ", 0, 1, "L");
        $pdf->SetFont("Arial", "B", 10);
        $pdf->Cell(40, 7, " Final Diagnosis: ", 0, 0, "L");
        $pdf->Cell(150, 7, "  ", 0, 1, "L");
        $pdf->SetFont("Arial", "", 10);
        $final_diagnosis_array = unserialize(DB::getInstance()->getName("patient_admission", $patientdata->Patient_Id, "Final_Diagnosis", "Patient_Id"));
        $final_diagnosis = "";
        for ($i = 0; $i < count($final_diagnosis_array); $i++) {
            $final_diagnosis .= ($i != count($final_diagnosis_array) - 1) ? $final_diagnosis_array[$i] . ", " : $final_diagnosis_array[$i];
        }
        
        $pdf->Line(12, $line_height + 147, 195, $line_height + 147);
          $pdf->Line(12, $line_height + 154, 195, $line_height + 154);
        $pdf->Write(7, $final_diagnosis);
        //classification
        $pdf->Cell(190, 14, "  ", 0, 1, "L");
        $pdf->SetFont("Arial", "B", 10);
        $pdf->Cell(40, 7, " Classification: ", 0, 0, "L");
        $pdf->Cell(150, 7, "  ", 0, 1, "L");
        $pdf->SetFont("Arial", "", 10);
        $pdf->Line(12, $line_height + 168, 195, $line_height + 168);
          $pdf->Line(12, $line_height + 175, 195, $line_height + 175);
        
        $pdf->Write(7, "");
        //Condition
        //pm  summary PM No.
        $pdf->Cell(190, 14, "  ", 0, 1, "L");
        $pdf->SetFont("Arial", "B", 10);
        $pdf->Cell(40, 7, " P.M.Summary: P.M. N.o ", 0, 0, "L");
        $pdf->Cell(150, 7, "  ", 0, 1, "L");
        $pdf->SetFont("Arial", "", 10);
        $pdf->Line(12, $line_height + 189, 195, $line_height + 189);
         $pdf->Line(12, $line_height + 196, 195, $line_height + 196);
       
        $pdf->Write(7, "");
        //cause of death
        $pdf->Cell(190, 14, "  ", 0, 1, "L");
        $pdf->SetFont("Arial", "B", 10);
        $pdf->Cell(40, 7, " Cause of Death: ", 0, 0, "L");
        $pdf->Cell(150, 7, "  ", 0, 1, "L");
        $pdf->SetFont("Arial", "", 10);
        $pdf->Line(12, $line_height + 210, 195, $line_height + 210);
         $pdf->Line(12, $line_height + 217, 195, $line_height + 217);
       
        $pdf->Write(7, "");
        $pdf->Cell(190, 14, "  ", 0, 1, "L");
        $pdf->Cell(0, 7, "Note: WCO, Infectious Disease or Police Notifications", 0, 1, "L");
        $pdf->Line(35, $line_height + 231, 195, $line_height + 231);
       
        $pdf->Cell(0, 7, "Compiled by:", 0, 1, "L");
    }
    $pdf->AutoPrint();
    $pdf->Output();
    //$pdf->output('D', 'PATIENT ADMISSION FACE SHEET' . ' ' . date("Ymdhis") . '.pdf');
} 
else if (($_GET['type']) && ($_GET['type'] == "download_Inpatient_register_report"))
    {
    $admissionReportName = $crypt->decode($_GET['admissionReportName']);
    $admissionsQuery = $crypt->decode($_GET['admissionsQuery']);
    $report_type = $crypt->decode($_GET['report_type']);

    header("Content-Type: application/xls");
    header("Content-Disposition: attachment; filename=" . $admissionReportName . ".xls");
    header("Pragma: no-cache");
    header("Expires: 0");
    echo $admissionReportName . "<br/>";
    ?>
    <table style="font-size: 15px;" border="1">
        <tr>
            <th>Date of Admission</th>
            <th>In-Patient Number</th>
            <th>Name</th>
            <th>Age</th>
            <th>Sex</th>
            <th>Address</th>
            <th>Refer</th>
            <th>Referring Center</th>
            <th>Date of Discharge</th>
            <th>Diagnosis</th>
            <th>Status</th>
        </tr>

        <?php
        $admissions_list = DB::getInstance()->query($admissionsQuery);
        foreach ($admissions_list->results() as $admissions):
            $provisional_diagnosis_array = unserialize($admissions->Provisional_Diagnosis);
            ?>
            <tr>
                <td><?php echo english_date($admissions->Admission_Date) ?></td>
                <td><?php echo "(" . $admissions->Patient_Number . ")"; ?></td>
                <td><?php echo $admissions->Fname . ' ' . $admissions->Lname; ?></td>
                <td><?php echo calculateAge(DB::getInstance()->getName("person", $admissions->Person_Id, "DOB", "Person_Id"), $date_today) ?></td>
                <td><?php echo $admissions->Gender ?></td>
                <td><?php
                    $address = $admissions->Village . ", " . $admissions->District;
                    echo $address;
                    ?></td>
                <td><?php echo $admissions->Admission_Referred_In ?></td>
                <td><?php echo $admissions->Admission_Referring_center ?></td>
                <td><?php echo $discharge = ($admissions->Discharge_Date != '') ? english_date($admissions->Discharge_Date) : ''; ?></td>
                <td><?php
                    for ($i = 0; $i < count($provisional_diagnosis_array); $i++) {
                        echo $provisional_diagonosis = ($i > 0 && $i <= count($provisional_diagnosis_array)) ? " + " . $provisional_diagnosis_array[$i] : $provisional_diagnosis_array[$i];
                    }
                    ?></td>
                <td><?php
                    if ($admissions->HIV_Status == "TRRD") {
                        $status = "TRR &#10004";
                    } elseif ($admissions->HIV_Status == "TRD") {
                        $status = "TR &#10004";
                    } else {
                        $status = $admissions->HIV_Status;
                    } echo $status;
                    ?></td>
            </tr>
            <?php
        endforeach;
        ?>  </table>
    <?php
} else if (($_GET['type']) && ($_GET['type'] == "download_rounding_sheet_report")) {
    $admissionReportName = $crypt->decode($_GET['admissionReportName']);
    $admissionsQuery = $crypt->decode($_GET['admissionsQuery']);
    $report_type = $crypt->decode($_GET['report_type']);
    $pdf->AddPage("L");
    $pdf->SetTextColor(180, 0, 16);
    $pdf->createHeader("$hospital_main_title", 185);
    $pdf->Cell(0, 5, $admissionReportName, 0, 1, "C");

    $pdf->SetTextColor(0, 0, 0);
    $pdf->SetFont("Arial", "B", 7);
    $pdf->Cell(40, 6, "Name", 1, 0, "L");
    $pdf->Cell(20, 6, "Age", 1, 0, "L");
    $pdf->Cell(25, 6, "Date of Admission", 1, 0, "L");
    $pdf->Cell(20, 6, "Length of stay", 1, 0, "L");
    $pdf->Cell(50, 6, "Provisional Diagnosis", 1, 0, "L");
    $pdf->Cell(15, 6, "Gravidity", 1, 0, "L");
    $pdf->Cell(15, 6, "Parity", 1, 0, "L");
    $pdf->Cell(18, 6, "Pregnant Y/N", 1, 0, "L");
    $pdf->Cell(22, 6, "Postpartum Y/N", 1, 0, "L");
    $pdf->Cell(22, 6, "Referral status", 1, 0, "L");
    $pdf->Cell(33, 6, "Admitting Doctor", 1, 1, "L");
    $pdf->SetFont("Arial", "", 0);
    $admissions_list = DB::getInstance()->query($admissionsQuery);
    foreach ($admissions_list->results() as $admissions):
        $provisional_diagnosis_array = unserialize($admissions->Provisional_Diagnosis);
        $column_height = (count($provisional_diagnosis_array) > 0) ? count($provisional_diagnosis_array) : 1;
        $pdf->Cell(40, $column_height * 5, $admissions->Fname . ' ' . $admissions->Lname, 1, 0, "L");
        $pdf->Cell(20, $column_height * 5, calculateAge(DB::getInstance()->getName("person", $admissions->Person_Id, "DOB", "Person_Id"), $date_today), 1, 0, "L"); //Age
        $pdf->Cell(25, $column_height * 5, english_date($admissions->Admission_Date), 1, 0, "L");
        $discharged_on = ($admissions->Discharge_Date != "") ? $admissions->Discharge_Date : $date_today;
        $pdf->Cell(20, $column_height * 5, calculateAge($admissions->Admission_Date, $discharged_on), 1, 0, "L"); //Length of stay
        $pdf->Cell(50, $column_height * 5, "", 1, 0, "L"); //Provisional Diagnosis
        $pdf->Cell(15, $column_height * 5, "", 1, 0, "L"); //Gravidity
        $pdf->Cell(15, $column_height * 5, "", 1, 0, "L"); //Parity
        $pdf->Cell(18, $column_height * 5, "", 1, 0, "L"); //Pregnant Y/N
        $pdf->Cell(22, $column_height * 5, "", 1, 0, "L"); //Postpartum Y/N
        $pdf->Cell(22, $column_height * 5, "$admissions->Admission_Referred_In", 1, 0, "L"); //Referral status
        $staffCheck = "SELECT CONCAT(person.Fname,' ',person.Lname) AS Full_Name FROM user,staff,person WHERE person.Person_Id=staff.Person_Id AND user.Staff_Id=staff.Staff_Id AND user.User_Id='$admissions->User_Id' LIMIT 1";
        $staff = DB::getInstance()->displayTableColumnValue($staffCheck, "Full_Name");
        $pdf->Cell(33, $column_height * 5, $staff, 1, 1, "L");
        if (count($provisional_diagnosis_array) > 0) {
            $pdf->Cell(0, -$column_height * 5, "", 0, 1, "L");
            for ($i = 0; $i < count($provisional_diagnosis_array); $i++) {
                $pdf->Cell(105, 5, "", 0, 0, "L");
                $pdf->Cell(50, 5, $provisional_diagnosis_array[$i], 0, 1, "L");
            }
        } else {
            $pdf->Cell(0, $column_height * 5, "", 0, 1, "L");
        }
    endforeach;
    $pdf->AutoPrint();
    $pdf->Output();
    // $pdf->output('D', '' . $admissionReportName . ' ' . date("Ymdhis") . '.pdf');
} else {
    redirect("We are unable to process your request at this time", "index.php?page=" . $crypt->encode("dashboard"));
}
?>
