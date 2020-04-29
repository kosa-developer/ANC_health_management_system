<?php

require ('pdf_header.php');
$pdf = new PDF();
$pdf->AliasNbPages();
if (isset($_GET['type']) && ($_GET['type'] == "download_gyn_report")) {
    $gynecologyReportName = $crypt->decode($_GET['gynecologyReportName']);
    $gynecology_report_type = $crypt->decode($_GET['gynecology_report_type']);
    $condition = $crypt->decode($_GET['condition_sent']);

    $totalAdmissions = 0;
    $total_referals = 0;
    $date_selected = Input::get("date_selected");
    $month_from = Input::get("month_from");
    $month_to = Input::get("month_to");
    $year = Input::get("year");
    $date_from = Input::get("date_from");
    $date_plus_aweek = increaseDateToDate(7, "days", $date_from);
    $date_to = Input::get("date_to");
    $month_from_and_year = $year . "-" . $month_from;
    $month_to_and_year = $year . "-" . str_pad(($month_from + 3), 2, '0', STR_PAD_LEFT);

    $patientList = "select * from patient,gynecology_ward where gynecology_ward.Patient_Id=patient.Patient_Id $condition ORDER BY patient.Patient_Id DESC";

    $query_gyn_patient_query = "select * from person,patient,gynecology_ward where patient.Person_Id=person.Person_Id AND gynecology_ward.Patient_Id=patient.Patient_Id $condition ORDER BY patient.Patient_Id DESC";
//    $query_gyn_patient_query = "select * from patient, gynecology_ward,person where gynecology_ward.Patient_Id=patient.Patient_Id AND gynecology_ward.Status=1 $condition ORDER BY Gynecology_Ward_Id DESC";
    $query_referals = "select * from gynecology_ward where gynecology_ward.Reffering='yes'";

    $total_referals = DB::getInstance()->countElements($query_referals);
    $totalAdmissions = DB::getInstance()->countElements($patientList);

    if ($gynecology_report_type == "Daily" || $gynecology_report_type == "Others") {
        $begin = new DateTime($date_from);
        $end = new DateTime($date_plus_aweek);
        $end = $end->modify('+0 day');
        $interval = new DateInterval('P1D');
        $daterange = new DatePeriod($begin, $interval, $end);


        $query_gyn_patient = DB::getInstance()->querySample($query_gyn_patient_query);
        $pdf->AddPage("L");
        $pdf->SetTextColor(180, 0, 16);
        $pdf->createHeader("DEPARTMENT OF GYNECOLOGY", 185);
        $pdf->Cell(0, 5, $gynecologyReportName, 0, 1, "C");
        $pdf->SetTextColor(0, 0, 0);
        $pdf->SetFont("Arial", "B", 8);
        $pdf->Cell(100, 4, "", 0, 0, "L");
        $pdf->Cell(40, 4, "Date", 1, 0, "L");
        $pdf->Cell(40, 4, date('l', strtotime($date_selected)) . ' ' . date('Y-m-d'), 1, 1, "L");
//    $pdf->Cell(40, 4, date('l', strtotime( date('Y-m-d'))).' '. date('Y-m-d'), 1, 1, "L");
//    $pdf->Cell(100, 4, "", 0, 0, "L");
//    $pdf->Cell(40, 4, "", 1, 0, "L");
//    $pdf->Cell(40, 4,"", 1, 1, "L");


        $pdf->Cell(40, 5, "Team on call", 0, 1, "L");
        $pdf->SetFont("Arial", "", 8);
        //Total width=280
        $pdf->Cell(70, 5, "Specialist...................", 0, 0, "L");
        $pdf->Cell(100, 5, "SHO:.....................", 0, 0, "L");
        $pdf->Cell(100, 5, "JHO/ Internee:....................", 0, 1, "L");

        $pdf->Cell(70, 5, "Total admissions: ...$totalAdmissions....", 0, 0, "L");
        $pdf->Cell(100, 5, "Obstetrics: ......", 0, 0, "L");
        $pdf->Cell(100, 5, "Total referals: ...$total_referals...", 0, 1, "L");

        $pdf->Cell(70, 5, "Total Refer Inns': ....9...", 0, 0, "L");
        $pdf->Cell(100, 5, "SVD: ....$totalSVD....", 0, 0, "L");
        $pdf->Cell(100, 5, "Partograms filled: ", 0, 1, "L");

        //Emergence C/Section
        $pdf->SetFont("Arial", "B", 8);
        $pdf->Cell(200, 4, "GYNECOLOGY WARD DAILY PATIENTS' LIST", 0, 1, "C");
        $pdf->SetFont("Arial", "", 8);
        $pdf->Cell(7, 8, "No.", 1, 0, "L");
        $pdf->Cell(40, 8, "Name", 1, 0, "L");
        $pdf->Cell(17, 8, "IP/No", 1, 0, "L");
        $pdf->Cell(12, 8, "Age", 1, 0, "L");
        $pdf->Cell(13, 8, "Sex", 1, 0, "L");
        $pdf->Cell(58, 8, "Address", 1, 0, "L");
        $pdf->Cell(16, 8, "Contact", 1, 0, "L");
        $pdf->Cell(13, 8, "Refferred", 1, 0, "L");
        $pdf->Cell(27, 8, "Refferring Center", 1, 0, "L");
        $pdf->Cell(25, 8, "Date of Discharge", 1, 0, "L");
        $pdf->Cell(12, 8, "Status", 1, 0, "L");
        $pdf->Cell(42, 8, "Diagnosis", 1, 1, "L");
//    $pdf->Cell(0, 8, "", 1, 1);
        $no = 1;
        $line_height = 0;
        foreach ($query_gyn_patient as $gynecologypatientdata) {
            $diagnosis = unserialize($gynecologypatientdata->Diagnosis);
            $count_diagnosis = sizeof($diagnosis);
            $column_height = ($count_diagnosis > 0) ? ( $count_diagnosis * 6) : 6;
            $pdf->Cell(7, $column_height, $no, 1, 0, "L");
            $pdf->Cell(40, $column_height, "$gynecologypatientdata->Fname  $gynecologypatientdata->Lname", 1, 0, "L");
            $pdf->Cell(17, $column_height, "$gynecologypatientdata->IP_NO ", 1, 0, "L");
            $pdf->Cell(12, $column_height, calculateAge($gynecologypatientdata->DOB, $date_today), 1, 0, "L");
            $pdf->Cell(13, $column_height, "$gynecologypatientdata->Gender", 1, 0, "L");
            $pdf->Cell(58, $column_height, $gynecologypatientdata->District . '-' . $gynecologypatientdata->Subcounty . '-' . $gynecologypatientdata->Village . '-' . $gynecologypatientdata->Residence, 1, 0, "L");
            $pdf->Cell(16, $column_height, "$gynecologypatientdata->Phone_Number", 1, 0, "L");
            $pdf->Cell(13, $column_height, "$gynecologypatientdata->Reffering", 1, 0, "L");
            $pdf->Cell(27, $column_height, $gynecologypatientdata->Reffering_Center, 1, 0, "L");
            $pdf->Cell(25, $column_height, "$gynecologypatientdata->Date_of_Delivery", 1, 0, "L");
            $pdf->Cell(12, $column_height, "$gynecologypatientdata->Patient_Status", 1, 0, "L");
            if (count($diagnosis) > 0) {
                $line_height = $line_height + count($diagnosis);
            } else {
                $line_height = $line_height + 1;
            }
            for ($x = 0; $x < count($diagnosis); $x++) {
                $pdf->Cell(42, 6, $diagnosis[$x], 0, 1);
                $pdf->Cell(240, 6, "", 0, 0);
            }

            $pdf->Cell(42, 0, "", 1, 1);
            $no++;
        }

        $pdf->Line(292, 67, 292, 71 + ($line_height * 6));
        //  $pdf->output('D', 'gynecology Report daily ' . date("Ymdhis") . '.pdf');
        $pdf->AutoPrint();
        $pdf->Output();
    } else
    if ($gynecology_report_type == "Weekly") {
        $query_gyn_patient = DB::getInstance()->querySample($query_gyn_patient_query);

        $pdf->AddPage("L");
        $pdf->SetTextColor(180, 0, 16);
        $pdf->createHeader("DEPARTMENT OF GYNECOLOGY", 185);

        $begin = new DateTime($date_from);
        $end = new DateTime($date_plus_aweek);
        $end = $end->modify('+0 day');
        $interval = new DateInterval('P1D');
        $daterange = new DatePeriod($begin, $interval, $end);

        //Emergence C/Section
//    $cur_date = $date->format("Y-m-d");

        $text1 = "TRR&#10004";
        $text = "TRR/";
        $pdf->SetFont("Arial", "B", 8);
        $pdf->Cell(200, 4, $gynecologyReportName . ' WEEKLY REPORT FROM ' . $date_from . ' TO ' . $date_plus_aweek, 0, 1, "C");
        $pdf->SetFont("Arial", "", 8);
        $pdf->Cell(30, 8, "Day", 1, 0, "L");
        $pdf->Cell(30, 8, "Date", 1, 0, "L");
        $pdf->Cell(26, 8, "Total Admissions", 1, 0, "L");
        $pdf->Cell(25, 8, "Total Outpatient", 1, 0, "L");
        $pdf->Cell(25, 8, "Total procedures", 1, 0, "L");
        $pdf->Cell(27, 8, "Total Refferals", 1, 0, "L");
        $pdf->Cell(27, 8, "Total Transfers in", 1, 0, "L");
        $pdf->Cell(27, 8, "Total Transfers out", 1, 0, "L");
        $pdf->Cell(45, 4, "Deaths", 1, 1, "C");
        $pdf->Cell(217, 4, "", 0, 0);
        $pdf->Cell(20, 4, "Maternal", 1, 0);
        $pdf->Cell(25, 4, "None maternal", 1, 1);

        //initailise total variables
        $totalAdmissions = 0;
        $totalfemales = 0;
        $totalmales = 0;
        $total_refrals = 0;
        $totalhivstatusesC = 0;
        $totalhivstatusesT = 0;
        $totalhivstatusesTR = 0;
        $totalhivstatusesTRR = 0;
        $totalhivstatusesTR1 = 0;
        $totalhivstatusesTRR1 = 0;
        $totalhivstatusesTRK = 0;
        $totalhivstatusesTRRK = 0;
        $totalhivstatusesTR2 = 0;
        $totalhivstatusesTRR2 = 0;
        //attach the relevant data 
        foreach ($daterange as $date) {
            $cur_date = $date->format("Y-m-d");

            $referalsQuery = "";

            $totalregistered = DB::getInstance()->countElements("select * from gynecology_ward where substr(gynecology_ward.Date_of_Admission,1,10) ='$cur_date'");
            $totalAdmissions = DB::getInstance()->countElements("select * from gynecology_ward,patient_admission where gynecology_ward.Patient_Id=patient_admission.Patient_Id and substr(gynecology_ward.Date_of_Admission,1,10) ='$cur_date'");
            $total_referals = DB::getInstance()->countElements("select * FROM gynecology_ward where gynecology_ward.Reffering='yes' AND substr(gynecology_ward.Date_of_Admission,1,10) ='$cur_date' ");
            $totalProcedures = DB::getInstance()->countElements("select * from gynecology_ward,patient_admission where gynecology_ward.Patient_Id=patient_admission.Patient_Id and patient_admission.Procedure_option='Yes' and substr(gynecology_ward.Date_of_Admission,1,10) ='$cur_date'");
            $totaltransferin = DB::getInstance()->countElements("select * from gynecology_ward,patient_admission where gynecology_ward.Patient_Id=patient_admission.Patient_Id and patient_admission.Admission_Referred_In IS NOT NULL and substr(gynecology_ward.Date_of_Admission,1,10) ='$cur_date'");
            $totaltransferout = DB::getInstance()->countElements("select * from gynecology_ward,patient_admission where gynecology_ward.Patient_Id=patient_admission.Patient_Id and patient_admission.Transferred_To!='' and substr(gynecology_ward.Date_of_Admission,1,10) ='$cur_date'");

            $outpatient = ($totalregistered >= $totalAdmissions) ? ($totalregistered - $totalAdmissions) : 0;

            $pdf->Cell(30, 6, strtoupper($date->format("l")), 1, 0, "L");
            $pdf->Cell(30, 6, $cur_date, 1, 0, "L");
            $pdf->Cell(26, 6, str_pad($totalAdmissions, 2, '0', STR_PAD_LEFT), 1, 0, "L");
            $pdf->Cell(25, 6, str_pad($outpatient, 2, '0', STR_PAD_LEFT), 1, 0, "L");
            $pdf->Cell(25, 6, str_pad($totalProcedures, 2, '0', STR_PAD_LEFT), 1, 0, "L");
            $pdf->Cell(27, 6, str_pad($total_referals, 2, '0', STR_PAD_LEFT), 1, 0, "L");
            $pdf->Cell(27, 6, str_pad($totaltransferin, 2, '0', STR_PAD_LEFT), 1, 0, "L");
            $pdf->Cell(27, 6, str_pad($totaltransferout, 2, '0', STR_PAD_LEFT), 1, 0, "L");
//    $pdf->Cell(100, 4, "HIV Status", 1, 1, "C");
//    $pdf->Cell(163, 4, "", 0, 0);
            $pdf->Cell(20, 6, "", 1, 0);
            $pdf->Cell(25, 6, "", 1, 1);
        }
        // $pdf->output('D', 'Weekly Report for Gynecology Report' . date("Ymdhis") . '.pdf');

        $pdf->AutoPrint();
        $pdf->Output();
    } else
    if ($gynecology_report_type = "Monthly") {
        
    }
} else {
    redirect("We are unable to process your request at this time", "index.php?page=" . $crypt->encode("dashboard"));
}
?>
