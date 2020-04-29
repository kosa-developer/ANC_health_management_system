<?php

require ('pdf_header.php');
$pdf = new PDF();
$pdf->AliasNbPages();
if (isset($_GET['type']) && ($_GET['type'] == "download_maternity_report")) {
    $maternityReportName = $crypt->decode($_GET['maternityReportName']);
    $maternity_report_type = $crypt->decode($_GET['maternity_report_type']);
    $condition = $crypt->decode($_GET['condition_sent']);

    $date_selected = Input::get("date_selected");
    $month_from = Input::get("month_from");
    $month_to = Input::get("month_to");
    $year = Input::get("year");
    $date_from = Input::get("date_from");
    $date_plus_aweek = increaseDateToDate(7, "days", $date_from);
    $date_to = Input::get("date_to");
    $month_from_and_year = $year . "-" . $month_from;
    $month_to_and_year = $year . "-" . str_pad(($month_from + 3), 2, '0', STR_PAD_LEFT);

    if ($maternity_report_type == "Daily") {

        $patientList = "select * from patient,maternity where maternity.Patient_Id=patient.Patient_Id $condition ORDER BY patient.Patient_Id DESC";
        $admissionsQuery = "select * from patient,patient_admission where patient_admission.Patient_Id=patient.Patient_Id AND EDD IS NOT NULL AND substr(patient_admission.Admission_Date,1,10)='$date_selected' ORDER BY patient.Patient_Id DESC";
        $patientEmergencyQuery = "select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id AND Mode_Deliver='Emergency C/Section' $condition ORDER BY patient.Patient_Id DESC";
        $patientSVDQuery = "select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id AND Mode_Deliver='SVD' $condition ORDER BY patient.Patient_Id DESC";
        $patientElectiveQuery = "select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id AND Mode_Deliver='Elective C/Section' $condition ORDER BY patient.Patient_Id DESC";
        $septicsQuery = "select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id AND Mode_Deliver!='SVD' AND Is_Septic='Yes' $condition ORDER BY patient.Patient_Id DESC";
        $totalAdmissions = DB::getInstance()->countElements($admissionsQuery);
        $totalEmergency = DB::getInstance()->countElements($patientEmergencyQuery);
        $totalSVD = DB::getInstance()->countElements($patientSVDQuery);
        $totalElective = DB::getInstance()->countElements($patientElectiveQuery);
        $totalSeptics = DB::getInstance()->countElements($septicsQuery);

        $pdf->AddPage("L");
        $pdf->SetTextColor(180, 0, 16);
        $pdf->createHeader("$hospital_main_title: DEPARTMENT OF OBSTETRICS", 185);
        $pdf->Cell(0, 5, $maternityReportName, 0, 1, "C");
        $pdf->SetTextColor(0, 0, 0);
        $pdf->SetFont("Arial", "B", 6);
        $pdf->Cell(100, 4, "", 0, 0, "L");
        $pdf->Cell(40, 4, "Date", 1, 0, "L");
        $pdf->Cell(40, 4, "", 1, 1, "L");
        $pdf->Cell(100, 4, "", 0, 0, "L");
        $pdf->Cell(40, 4, "", 1, 0, "L");
        $pdf->Cell(40, 4, "", 1, 1, "L");

        $pdf->Cell(40, 5, "Team on call", 0, 1, "L");
        $pdf->SetFont("Arial", "", 7);
        //Total width=280
        $pdf->Cell(70, 5, "Specialist...................", 0, 0, "L");
        $pdf->Cell(100, 5, "SHO:.....................", 0, 0, "L");
        $pdf->Cell(100, 5, "JHO/ Internee:....................", 0, 1, "L");

        $pdf->Cell(70, 5, "Total admissions: ...$totalAdmissions....", 0, 0, "L");
        $pdf->Cell(100, 5, "Obstetrics: ......", 0, 0, "L");
        $pdf->Cell(100, 5, "Sepsis: ...$totalSeptics...", 0, 1, "L");

        $pdf->Cell(70, 5, "Total Deliveries: ..." . ($totalSVD + $totalEmergency + $totalElective) . ".....", 0, 0, "L");
        $pdf->Cell(100, 5, "SVD: ....$totalSVD....", 0, 0, "L");
        $pdf->Cell(100, 5, "Partograms filled: ", 0, 1, "L");

        $pdf->Cell(70, 5, "Total C/Section: ...." . ($totalEmergency + $totalElective) . "....", 0, 0, "L");
        $pdf->Cell(100, 5, "Emergency: ....$totalEmergency.....", 0, 0, "L");
        $pdf->Cell(100, 5, "Elective: ....$totalElective....", 0, 1, "L");
        //Emergence C/Section
        $pdf->SetFont("Arial", "B", 8);
        $pdf->Cell(200, 4, "Emergence C/Section Details", 0, 1, "C");
        $pdf->SetFont("Arial", "", 5);
        $pdf->Cell(8, 8, "No.", 1, 0, "L");
        $pdf->Cell(40, 8, "Name", 1, 0, "L");
        $pdf->Cell(7, 8, "Age", 1, 0, "L");
        $pdf->Cell(8, 8, "Parity", 1, 0, "L");
        $pdf->Cell(13, 8, "Booked (Y/N)", 1, 0, "L");
        $pdf->Cell(40, 8, "Indications", 1, 0, "L");
        $pdf->Cell(20, 8, "Anasthesia", 1, 0, "L");
        $pdf->Cell(27, 8, "Fetal Outcome", 1, 0, "L");
        $pdf->Cell(17, 8, "Maternal Outcome", 1, 0, "L");
        $pdf->Cell(25, 8, "Decision to delivery time", 1, 0, "L");
        $pdf->Cell(40, 8, "Reason for delay", 1, 0, "L");
        $pdf->Cell(40, 4, "Postop Observations", 1, 1, "L");
        $pdf->Cell(245, 4, "", 0, 0, "L");
        $pdf->Cell(20, 4, "1st 4hrs", 1, 0, "L");
        $pdf->Cell(20, 4, "5-24 hrs", 1, 1, "L");

        $pdf->Cell(136, 4, "", 1, 0, "L");
        $pdf->Cell(5, 4, "Wt", 1, 0, "L");
        $pdf->Cell(10, 4, "A/S", 1, 0, "L");
        $pdf->Cell(12, 4, "Age", 1, 0, "L");
        $pdf->Cell(82, 4, "", 1, 0, "L");
        $pdf->Cell(10, 4, "BP", 1, 0, "L");
        $pdf->Cell(10, 4, "PR", 1, 0, "L");
        $pdf->Cell(10, 4, "BP", 1, 0, "L");
        $pdf->Cell(10, 4, "PR", 1, 1, "L");
        //Looping for data
        $patientEmergencyList = DB::getInstance()->querySample($patientEmergencyQuery);
        $no = 0;
        $pdf->SetFont("Arial", "", 7);
        foreach ($patientEmergencyList AS $patientdata) {
            $indications = unserialize($patientdata->Indications);
            $count_indications = sizeof($indications);
            $column_height = ($count_indications > 0) ? ($count_indications * 4) : 4;
            $no++;
            $APGAR_Score = $patientdata->Apger_Score;
            $APGAR_Score .= ($patientdata->Final_apigar_score != "") ? "-" . $patientdata->Final_apigar_score : "";
            $pdf->Cell(8, $column_height, "$no", 1, 0, "L");
            $pdf->Cell(40, $column_height, "$patientdata->Fname  $patientdata->Lname", 1, 0, "L");
            $pdf->Cell(7, $column_height, calculateAge($patientdata->DOB, $date_today), 1, 0, "L");
            $pdf->Cell(8, $column_height, "$patientdata->Parity", 1, 0, "L");
            $pdf->Cell(13, $column_height, "", 1, 0, "L"); //Booked (Y/N)
            $pdf->Cell(40, $column_height, "", 1, 0, "L"); //Indications
            $pdf->Cell(20, $column_height, "", 1, 0, "L"); //Anasthesia
            $pdf->Cell(5, $column_height, "$patientdata->Fetal_Wt", 1, 0, "L"); //Fetal Weight
            $pdf->Cell(10, $column_height, "$APGAR_Score", 1, 0, "L"); //APGAR Score
            $pdf->Cell(12, $column_height, calculateAge($patientdata->DOD, $date_today), 1, 0, "L"); //Fetal Age
            $pdf->Cell(17, $column_height, "$patientdata->Maternal_Outcome", 1, 0, "L"); //Maternal outcome
            $pdf->Cell(25, $column_height, "", 1, 0, "L"); //Decision to delivery time
            $pdf->Cell(40, $column_height, "", 1, 0, "L"); //Reason for delay
            $pdf->Cell(10, $column_height, "", 1, 0, "L"); //BP
            $pdf->Cell(10, $column_height, "", 1, 0, "L"); //PR
            $pdf->Cell(10, $column_height, "", 1, 0, "L"); //BP
            $pdf->Cell(10, $column_height, "", 1, 1, "L"); //PR
            for ($x = 0; $x < count($indications); $x++) {
                $pdf->Cell(76, -4, "", 0, 0, "L");
                $pdf->Cell(40, -4, $indications[$x], 0, 1, "L");
            }

            $pdf->Cell(0, $column_height, "", 0, 1, "L");
        }
        //Emergence Laparatomy
        $pdf->SetFont("Arial", "B", 8);
        $pdf->Cell(200, 10, "Emergence Laparatomy (Raptured Uterus)", 0, 1, "C");
        $pdf->SetFont("Arial", "", 7);
        $pdf->Cell(10, 8, "No.", 1, 0, "L");
        $pdf->Cell(50, 8, "Name", 1, 0, "L");
        $pdf->Cell(10, 8, "Age", 1, 0, "L");
        $pdf->Cell(10, 8, "Parity", 1, 0, "L");
        $pdf->Cell(55, 8, "Indications", 1, 0, "L");
        $pdf->Cell(30, 8, "Anasthesia", 1, 0, "L");
        $pdf->Cell(30, 8, "Operation", 1, 0, "L");
        $pdf->Cell(30, 8, "Fetal Outcome", 1, 0, "L");
        $pdf->Cell(20, 8, "Maternal Outcome", 1, 0, "L");
        $pdf->Cell(40, 4, "Postop Observations", 1, 1, "L");
        $pdf->Cell(245, 4, "", 0, 0, "L");
        $pdf->Cell(20, 4, "1st 4hrs", 1, 0, "L");
        $pdf->Cell(20, 4, "5-24 hrs", 1, 1, "L");

        $pdf->Cell(195, 4, "", 1, 0, "L");
        $pdf->Cell(8, 4, "Wt", 1, 0, "L");
        $pdf->Cell(10, 4, "A/S", 1, 0, "L");
        $pdf->Cell(12, 4, "Age", 1, 0, "L");
        $pdf->Cell(20, 4, "", 1, 0, "L");
        $pdf->Cell(10, 4, "BP", 1, 0, "L");
        $pdf->Cell(10, 4, "PR", 1, 0, "L");
        $pdf->Cell(10, 4, "BP", 1, 0, "L");
        $pdf->Cell(10, 4, "PR", 1, 1, "L");

        //Data Here
        //comes from either antenatal or gynecology
        //Table for elective gynecology operations
        //Referrals
        $patientReferralsQuery = "select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id AND Referred_In='yes' $condition ORDER BY patient.Patient_Id DESC";
        $totalReferrals = DB::getInstance()->countElements($patientReferralsQuery);
        $pdf->SetFont("Arial", "B", 8);
        $pdf->Cell(200, 10, "Number of referrals:.....$totalReferrals......", 0, 1, "C");
        $pdf->SetFont("Arial", "", 7);
        $pdf->Cell(10, 8, "No.", 1, 0, "L");
        $pdf->Cell(60, 8, "Name", 1, 0, "L");
        $pdf->Cell(10, 8, "Age", 1, 0, "L");
        $pdf->Cell(15, 8, "Parity", 1, 0, "L");
        $pdf->Cell(60, 8, "Reason for referral", 1, 0, "L");
        $pdf->Cell(60, 8, "Referring unit", 1, 0, "L");
        $pdf->Cell(40, 4, "Fetal Outcome", 1, 0, "L");
        $pdf->Cell(30, 8, "Maternal Outcome", 1, 1, "L");

        $pdf->Cell(215, -4, "", 0, 0, "L");
        $pdf->Cell(12, -4, "Wt", 1, 0, "L");
        $pdf->Cell(13, -4, "A/S", 1, 0, "L");
        $pdf->Cell(15, -4, "Age", 1, 1, "L");
        $pdf->Cell(0, 4, "", 0, 1, "L");

        //Data for referrals
        $patientReferralsList = DB::getInstance()->querySample($patientReferralsQuery);
        $no = 0;
        foreach ($patientReferralsList AS $patientdata) {
            $no++;
            $APGAR_Score = $patientdata->Apger_Score;
            $APGAR_Score .= ($patientdata->Final_apigar_score != "") ? "-" . $patientdata->Final_apigar_score : "";
            $pdf->Cell(10, 4, "$no", 1, 0, "L");
            $pdf->Cell(60, 4, "$patientdata->Fname  $patientdata->Lname", 1, 0, "L");
            $pdf->Cell(10, 4, calculateAge($patientdata->DOB, $date_today), 1, 0, "L");
            $pdf->Cell(15, 4, "$patientdata->Parity", 1, 0, "L");
            $pdf->Cell(60, 4, "$patientdata->Referring_Reason", 1, 0, "L"); //Reason for referral
            $pdf->Cell(60, 4, "$patientdata->Referring_Center", 1, 0, "L"); //Referring center
            $pdf->Cell(12, 4, "$patientdata->Fetal_Wt", 1, 0, "L"); //Fetal Weight
            $pdf->Cell(13, 4, "$APGAR_Score", 1, 0, "L"); //APGAR Score
            $pdf->Cell(15, 4, calculateAge($patientdata->DOD, $date_today), 1, 0, "L"); //Fetal Age
            $pdf->Cell(30, 4, "$patientdata->Maternal_Outcome", 1, 1, "L"); //Maternal outcome
        }

        //Maternal Deaths
        $maternalDeathsQuery = "select * from person,patient,maternity,patient_admission where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id AND patient_admission.Patient_Id=patient.Patient_Id AND Maternal_Outcome='Dead' $condition ORDER BY patient.Patient_Id DESC";
        $totalMaternalDeaths = DB::getInstance()->countElements($maternalDeathsQuery);
        $pdf->SetFont("Arial", "B", 8);
        $pdf->Cell(200, 10, "Number of maternal deaths:.....$totalMaternalDeaths......", 0, 1, "C");
        $pdf->SetFont("Arial", "", 7);
        $pdf->Cell(10, 8, "No.", 1, 0, "L");
        $pdf->Cell(60, 8, "Name", 1, 0, "L");
        $pdf->Cell(10, 8, "Age", 1, 0, "L");
        $pdf->Cell(25, 8, "Parity", 1, 0, "L");
        $pdf->Cell(25, 8, "WOA", 1, 0, "L");
        $pdf->Cell(60, 8, "Probable cause of death", 1, 0, "L");
        $pdf->Cell(60, 8, "Length of stay in hospital", 1, 0, "L");
        $pdf->Cell(35, 8, "Postmotem Findings", 1, 1, "L");

        //Data for Maternal Death
        $maternalDeathsList = DB::getInstance()->querySample($maternalDeathsQuery);
        $no = 0;
        foreach ($maternalDeathsList AS $patientdata) {
            $no++;
            $singleAdmissionQuery = "select * from patient,patient_admission,maternity where maternity.Patient_Id=patient.Patient_Id AND patient_admission.Patient_Id=patient.Patient_Id AND EDD IS NOT NULL AND patient_admission.Patient_Id='$patientdata->Patient_Id' AND substr(patient_admission.Admission_Date,1,10)='$date_selected' ORDER BY patient.Patient_Id DESC";
            $admissionDate = $patientdata->Admission_Date;
            $dischargeDate = ($patientdata->Discharge_Date == "") ? $date_today : $patientdata->Discharge_Date;
            $pdf->Cell(10, 4, "$no", 1, 0, "L");
            $pdf->Cell(60, 4, "$patientdata->Fname  $patientdata->Lname", 1, 0, "L");
            $pdf->Cell(10, 4, calculateAge($patientdata->DOB, $date_today), 1, 0, "L");
            $pdf->Cell(25, 4, "$patientdata->Parity", 1, 0, "L");
            $pdf->Cell(25, 4, "$patientdata->WOA", 1, 0, "L"); //WOA
            $pdf->Cell(60, 4, "$patientdata->Maternal_Death_Cause", 1, 0, "L"); //Cause of death
            $pdf->Cell(60, 4, calculateAge($admissionDate, $dischargeDate), 1, 0, "L"); //Length of stay in hospital
            $pdf->Cell(35, 4, "", 1, 1, "L"); //Postmotem findings
        }
    } else
    if ($maternity_report_type == "Weekly") {
        $pdf->AddPage("L");
        $pdf->SetTextColor(180, 0, 16);
        $pdf->createHeader("$hospital_main_title: DEPARTMENT OF OBSTETRICS", 185);
        $pdf->Cell(0, 5, $maternityReportName, 0, 1, "C");
        $pdf->SetTextColor(0, 0, 0);
        $pdf->SetFont("Arial", "B", 8);
        $pdf->Cell(30, 10, "DAY", 1, 0, "L");
        $pdf->Cell(40, 5, "No. of Admissions", 1, 0, "L");
        $pdf->Cell(40, 5, "No. of deliveries", 1, 0, "L");
        $pdf->Cell(50, 10, "Emergency Raptured Uterus", 1, 0, "L");
        $pdf->Cell(40, 5, "No. of still births", 1, 0, "L");
        $pdf->Cell(30, 10, "No. of referrals", 1, 0, "L");
        $pdf->Cell(25, 10, "Maternal deaths", 1, 0, "L");
        $pdf->Cell(20, 10, "I.C.U", 1, 1, "L");

        $pdf->Cell(30, -5, "", 0, 0, "L");
        $pdf->Cell(40, -5, "OBS", 1, 0, "L");
        $pdf->Cell(20, -5, "SVD", 1, 0, "L");
        $pdf->Cell(20, -5, "CS", 1, 0, "L");
        $pdf->Cell(50, -5, "", 0, 0, "L"); //Emerg RAP....
        $pdf->Cell(20, -5, "FSB", 1, 0, "L");
        $pdf->Cell(20, -5, "MSB", 1, 0, "L");
        $pdf->Cell(30, -5, "", 0, 0, "L");
        $pdf->Cell(25, -5, "", 0, 0, "L");
        $pdf->Cell(20, -5, "", 0, 0, "L");
        $pdf->Cell(0, 0, "", 0, 1, "L");

        //Looping through

        $begin = new DateTime($date_from);
        $end = new DateTime($date_plus_aweek);
        $end = $end->modify('+0 day');
        $interval = new DateInterval('P1D');
        $daterange = new DatePeriod($begin, $interval, $end);
        $pdf->SetFont("Arial", "", 8);
        $totalAdmissions = 0;
        $totalEmergency = 0;
        $totalSVD = 0;
        $totalElective = 0;
        $totalReferrals = 0;
        $totalStllBirthMSB = 0;
        $totalStllBirthFSB = 0;
        $totalMaternalDeaths = 0;
        foreach ($daterange as $date) {
            $cur_date = $date->format("Y-m-d");
            $admissionsQuery = "select * from maternity where substr(maternity.DOD,1,10) ='$cur_date' ";
            $patientEmergencyQuery = "select * from maternity where Mode_Deliver='Emergency C/Section' AND substr(maternity.DOD,1,10) ='$cur_date' ";
            $patientSVDQuery = "select * from maternity where Mode_Deliver='SVD' AND substr(maternity.DOD,1,10) ='$cur_date' ";
            $patientElectiveQuery = "select * from maternity where Mode_Deliver='Elective C/Section' AND substr(maternity.DOD,1,10) ='$cur_date' ";
            $referralQuery = "select * from maternity where Referred_In='yes' AND substr(maternity.DOD,1,10) ='$cur_date' ";
            $stillBirthFSBQuery = "select * from maternity where Fetal_Death='FSB' AND substr(maternity.DOD,1,10) ='$cur_date' ";
            $stillBirthMSBQuery = "select * from maternity where Fetal_Death='MSB' AND substr(maternity.DOD,1,10) ='$cur_date' ";
            $maternalDeathQuery = "select * from maternity where Maternal_Outcome='Dead' AND substr(maternity.DOD,1,10) ='$cur_date' ";
            $totalAdmissions += $Admissions = DB::getInstance()->countElements($admissionsQuery);
            $totalEmergency += $Emergency = DB::getInstance()->countElements($patientEmergencyQuery);
            $totalSVD += $SVD = DB::getInstance()->countElements($patientSVDQuery);
            $totalElective += $Elective = DB::getInstance()->countElements($patientElectiveQuery);
            $totalReferrals += $Referrals = DB::getInstance()->countElements($referralQuery);
            $totalStllBirthMSB += $StllBirthMSB = DB::getInstance()->countElements($stillBirthMSBQuery);
            $totalStllBirthFSB += $StllBirthFSB = DB::getInstance()->countElements($stillBirthFSBQuery);
            $totalMaternalDeaths += $MaternalDeaths = DB::getInstance()->countElements($maternalDeathQuery);

            $pdf->Cell(30, 8, strtoupper($date->format("l")), 1, 0, "L"); //Get day of the week name
            $pdf->Cell(40, 8, str_pad($Admissions, 2, '0', STR_PAD_LEFT), 1, 0, "L"); //OBS
            $pdf->Cell(20, 8, str_pad($SVD, 2, '0', STR_PAD_LEFT), 1, 0, "L"); //SVD
            $pdf->Cell(20, 8, str_pad($Emergency + $Elective, 2, '0', STR_PAD_LEFT), 1, 0, "L"); //CS
            $pdf->Cell(50, 8, "", 1, 0, "L"); //Emerg RAP....
            $pdf->Cell(20, 8, str_pad($StllBirthFSB, 2, '0', STR_PAD_LEFT), 1, 0, "L"); //FSB
            $pdf->Cell(20, 8, str_pad($StllBirthMSB, 2, '0', STR_PAD_LEFT), 1, 0, "L"); //MSB
            $pdf->Cell(30, 8, str_pad($Referrals, 2, '0', STR_PAD_LEFT), 1, 0, "L"); //Total referrals
            $pdf->Cell(25, 8, str_pad($MaternalDeaths, 2, '0', STR_PAD_LEFT), 1, 0, "L"); //Maternal deaths
            $pdf->Cell(20, 8, "", 1, 1, "L"); //ICU
        }

        $pdf->Cell(30, 8, "TOTAL", 1, 0, "L"); //Get day of the week name
        $pdf->Cell(40, 8, str_pad($totalAdmissions, 2, '0', STR_PAD_LEFT), 1, 0, "L"); //OBS
        $pdf->Cell(20, 8, str_pad($totalSVD, 2, '0', STR_PAD_LEFT), 1, 0, "L"); //SVD
        $pdf->Cell(20, 8, str_pad($totalEmergency + $totalElective, 2, '0', STR_PAD_LEFT), 1, 0, "L"); //CS
        $pdf->Cell(50, 8, "", 1, 0, "L"); //Emerg RAP....
        $pdf->Cell(20, 8, str_pad($totalStllBirthFSB, 2, '0', STR_PAD_LEFT), 1, 0, "L"); //FSB
        $pdf->Cell(20, 8, str_pad($totalStllBirthMSB, 2, '0', STR_PAD_LEFT), 1, 0, "L"); //MSB
        $pdf->Cell(30, 8, str_pad($totalReferrals, 2, '0', STR_PAD_LEFT), 1, 0, "L"); //Total referrals
        $pdf->Cell(25, 8, str_pad($totalMaternalDeaths, 2, '0', STR_PAD_LEFT), 1, 0, "L"); //Maternal deaths
        $pdf->Cell(20, 8, "", 1, 1, "L"); //ICU

        $pdf->SetFont("Arial", "", 15);
        $c_section_percentage = number_format((($totalEmergency + $totalElective) / ($totalSVD + $totalEmergency + $totalElective)) * 100, 0);
        $pdf->Cell(0, 15, "C-Section Rate: ....$c_section_percentage%....", 0, 1, "L");

        $pdf->SetFont("Arial", "B", 10);
        $pdf->Cell(0, 8, "Compiled by:...................", 0, 1, "L");
    } else if ($maternity_report_type == "Monthly") {
        $condition = $crypt->decode($_GET['condition_sent']);
        $totalabnormality = 0;
        $totalAdmissions = DB::getInstance()->countElements("select * from person,patient,maternity,patient_admission where patient.Patient_Id=patient_admission.Patient_Id and patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id $condition");
        $totalBedoccupancy = 0 + DB::getInstance()->countElements("select distinct(patient_admission.Bed_Id) from person,patient,maternity,patient_admission where patient.Patient_Id=patient_admission.Patient_Id and patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id $condition");
        $total_beds = 0 + DB::getInstance()->countElements("select * from bed");
        $totaldischarge = DB::getInstance()->countElements("select * from person,patient,maternity,patient_admission where patient.Patient_Id=patient_admission.Patient_Id and patient_admission.Discharge_Date IS NOT NULL and patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id $condition");

        $stillBirthFSBQuerycs = 0 + DB::getInstance()->countElements("select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id AND maternity.Fetal_Death='FSB' AND (maternity.Mode_Deliver='Emergency C/Section' OR maternity.Mode_Deliver='Elective C/Section')");
        // $stillBirthFSBQuerycvd = 0 + DB::getInstance()->countElements("select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id AND maternity.Fetal_Death='FSB'");
        $stillBirthMSBQuery = 0 + DB::getInstance()->countElements("select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id AND maternity.Fetal_Death='MSB'");

        $totalEmergency = 0 + DB::getInstance()->countElements("select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id AND maternity.Mode_Deliver='Emergency C/Section' $condition ORDER BY patient.Patient_Id DESC");
        $totalElective = 0 + DB::getInstance()->countElements("select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id AND Mode_Deliver='Elective C/Section' $condition ORDER BY patient.Patient_Id DESC");
        $totalreffer_in = 0 + DB::getInstance()->countElements("select * from patient,maternity where maternity.Patient_Id=patient.Patient_Id and maternity.Referred_In='yes' $condition");
        $totalrefferedouts = DB::getInstance()->countElements("select * from person,patient,maternity,patient_admission where patient.Patient_Id=patient_admission.Patient_Id and patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id AND patient_admission.Referred_Out_Center!='' $condition");
        $totaldeadchildren = 0 + DB::getInstance()->countElements("select * from patient,maternity where maternity.Patient_Id=patient.Patient_Id and maternity.Fetal_Outcome='Dead' $condition");
        $totalalivechildren = 0 + DB::getInstance()->countElements("select * from patient,maternity where maternity.Patient_Id=patient.Patient_Id and maternity.Fetal_Outcome='Alive' $condition");
        $totalabnormality = 0 + DB::getInstance()->countElements("select * from patient,maternity where  maternity.Patient_Id=patient.Patient_Id and maternity.Abnormalities!='Nill' $condition");
        $dilivelies10_19 = 0 + DB::getInstance()->countElements("select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id and TIMESTAMPDIFF(YEAR,DOB,CURDATE())>10 and TIMESTAMPDIFF(YEAR,DOB,CURDATE())<20 $condition");
        $dilivelies20_24 = 0 + DB::getInstance()->countElements("select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id and TIMESTAMPDIFF(YEAR,DOB,CURDATE())>19 and TIMESTAMPDIFF(YEAR,DOB,CURDATE())<26 $condition");
        $diliveliesabove25 = 0 + DB::getInstance()->countElements("select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id and TIMESTAMPDIFF(YEAR,DOB,CURDATE())>25  $condition");
        $diliveliesdead10_19 = 0 + DB::getInstance()->countElements("select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id and maternity.Maternal_Outcome='Dead' and TIMESTAMPDIFF(YEAR,DOB,CURDATE())>10 and TIMESTAMPDIFF(YEAR,DOB,CURDATE())<20 $condition");
        $diliveliesdead20_24 = 0 + DB::getInstance()->countElements("select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id and maternity.Maternal_Outcome='Dead' and TIMESTAMPDIFF(YEAR,DOB,CURDATE())>19 and TIMESTAMPDIFF(YEAR,DOB,CURDATE())<26 $condition");
        $diliveliesadeadbove25 = 0 + DB::getInstance()->countElements("select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id and maternity.Maternal_Outcome='Dead' and TIMESTAMPDIFF(YEAR,DOB,CURDATE())>25  $condition");

        $lowbirthweight = 0 + DB::getInstance()->countElements("select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id  and (maternity.Fetal_Wt*1000)>1500 and (maternity.Fetal_Wt*1000)<2500  $condition");
        $verylowbirthweight = 0 + DB::getInstance()->countElements("select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id and (maternity.Fetal_Wt*1000)>1000 and (maternity.Fetal_Wt*1000)<1500   $condition");
        $extreamlowbirthweight = 0 + DB::getInstance()->countElements("select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id  and (maternity.Fetal_Wt*1000)<1000  $condition");

        $c = 0 + DB::getInstance()->countElements("select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id  and maternity.Hiv_Status='C'  $condition");
        $t = 0 + DB::getInstance()->countElements("select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id  and maternity.Hiv_Status='T'  $condition");
        $tr = DB::getInstance()->countElements("select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id  and maternity.Hiv_Status='TR'  $condition");
        $trr = DB::getInstance()->countElements("select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id  and maternity.Hiv_Status='TRR'  $condition");
        $tr1 = DB::getInstance()->countElements("select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id  and maternity.Hiv_Status='TRâœ”'  $condition");
        $trr1 = DB::getInstance()->countElements("select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id  and maternity.Hiv_Status='TRRâœ”'  $condition");
        $trk = DB::getInstance()->countElements("select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id  and maternity.Hiv_Status='TRK'  $condition");
        $trrk = DB::getInstance()->countElements("select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id  and maternity.Hiv_Status='TRRK'  $condition");
        $tr3 = DB::getInstance()->countElements("select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id  and maternity.Hiv_Status='TR+'  $condition");
        $trr3 = DB::getInstance()->countElements("select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id  and maternity.Hiv_Status='TRR+'  $condition");

        $Mode_Deliver = DB::getInstance()->countElements("select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id  and maternity.Mode_Deliver='SVD'  $condition");

        $pdf->AddPage("L");
        $pdf->SetTextColor(180, 0, 16);
        $pdf->createHeader("$hospital_monthly_title: DEPARTMENT OF OBSTETRICS", 185);
        $pdf->Cell(0, 5, $maternityReportName, 0, 1, "C");
        $pdf->SetTextColor(0, 0, 0);
        $pdf->SetFont("Arial", "B", 8);
        $pdf->Line(5, 40, 290, 40);
        $pdf->Line(5, 195, 290, 195);


//	vertical lines
        $pdf->Line(5, 40, 5, 195);
        $pdf->Line(96, 40, 96, 195);
        $pdf->Line(194, 40, 194, 195);
        $pdf->Line(290, 40, 290, 195);
        //FORM DATA
        $pdf->Cell(30, 10, "", 0, 1, "L");
        $pdf->Cell(70, 5, "Category", 0, 0, "L");
        $pdf->Cell(16, 5, "Number", 0, 0, "R");
        $pdf->Cell(70, 5, "Category", 0, 0, "L");
        $pdf->Cell(28, 5, "Number", 0, 0, "R");
        $pdf->Cell(70, 5, "Category", 0, 0, "L");
        $pdf->Cell(26, 5, "Number", 0, 1, "R");
        $pdf->SetFont("Arial", "", 7);

        $pdf->Cell(70, 4, "Admissions", 0, 0, "L");
        $pdf->Cell(16, 4, "....$totalAdmissions.....", 0, 0, "R");
        $pdf->Cell(70, 4, "Puerperal sepsis", 0, 0, "L");
        $pdf->Cell(28, 4, ".........", 0, 0, "R");
        $pdf->Cell(70, 4, "Low birth weight babies 0<2500g", 0, 0, "L");
        $pdf->Cell(26, 4, "...$lowbirthweight....", 0, 1, "R");

        $pdf->Cell(70, 4, "Discharge", 0, 0, "L");
        $pdf->Cell(16, 4, "....$totaldischarge....", 0, 0, "R");
        $pdf->Cell(70, 4, "Utirine rupture", 0, 0, "L");
        $pdf->Cell(28, 4, ".........", 0, 0, "R");
        $pdf->Cell(70, 4, "Very low birth weight babies VLBW (<1500g)", 0, 0, "L");
        $pdf->Cell(26, 4, "....$verylowbirthweight.....", 0, 1, "R");

        $pdf->Cell(70, 4, "Patient days", 0, 0, "L");
        $pdf->Cell(16, 4, "......", 0, 0, "R");
        $pdf->Cell(70, 4, "Ectopic pregnancies", 0, 0, "L");
        $pdf->Cell(28, 4, "...........", 0, 0, "R");
        $pdf->Cell(70, 4, "Extreamly low birth weight babies VLBW (<1000g)", 0, 0, "L");
        $pdf->Cell(26, 4, "....$extreamlowbirthweight.....", 0, 1, "R");

        $pdf->Cell(70, 4, "Average length of stay(days)", 0, 0, "L");
        $pdf->Cell(16, 4, "..........", 0, 0, "R");
        $pdf->Cell(70, 4, "Multiple prignancies", 0, 0, "L");
        $pdf->Cell(28, 4, "............", 0, 0, "R");
        $pdf->Cell(70, 4, "Preterm deliveries (28-37 weeks)", 0, 0, "L");
        $pdf->Cell(26, 4, "...........", 0, 1, "R");

        $pdf->Cell(70, 4, "Bed occupancy rate(BOR)", 0, 0, "L");
        $pdf->Cell(16, 4, "...." . round(($totalBedoccupancy / $total_beds) * 100, 2) . "%....", 0, 0, "R");
        $pdf->Cell(70, 4, "Babies born with diffects", 0, 0, "L");
        $pdf->Cell(28, 4, "......$totalabnormality.....", 0, 0, "R");
        $pdf->Cell(70, 4, "Term deliveries (>37-42 weeks)", 0, 0, "L");
        $pdf->Cell(26, 4, "........", 0, 1, "R");

        $pdf->Cell(70, 4, "Referals in", 0, 0, "L");
        $pdf->Cell(16, 4, "....$totalreffer_in....", 0, 0, "R");
        $pdf->Cell(70, 4, "intrauterine fetal deaths (IUPD)", 0, 0, "L");
        $pdf->Cell(28, 4, "........", 0, 0, "R");
        $pdf->Cell(70, 4, "Postterm deliveries (>42 weeks)", 0, 0, "L");
        $pdf->Cell(26, 4, "..........", 0, 1, "R");

        $pdf->Cell(70, 4, "Referals out", 0, 0, "L");
        $pdf->Cell(16, 4, ".....$totalrefferedouts.....", 0, 0, "R");
        $pdf->Cell(70, 4, "Born before arrival:  Alive", 0, 0, "L");
        $pdf->Cell(28, 4, ".......", 0, 0, "R");
        $pdf->Cell(70, 4, "", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");

        $pdf->Cell(70, 4, "Deliveries in unit:", 0, 0, "L");
        $pdf->Cell(16, 4, "", 0, 0, "R");
        $pdf->Cell(70, 4, "Born before arrival:  Dead", 0, 0, "L");
        $pdf->Cell(28, 4, "........", 0, 0, "R");
        $pdf->Cell(70, 4, "", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");

        $pdf->Cell(70, 4, "10-19 yrs", 0, 0, "R");
        $pdf->Cell(16, 4, "...$dilivelies10_19...", 0, 0, "R");
        $pdf->Cell(70, 4, "Congenital abnormalities", 0, 0, "L");
        $pdf->Cell(28, 4, "........", 0, 0, "R");
        $pdf->Cell(70, 4, "", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");

        $pdf->Cell(70, 4, "20-24 yrs", 0, 0, "R");
        $pdf->Cell(16, 4, "...$dilivelies20_24...", 0, 0, "R");
        $pdf->Cell(70, 4, "Birth asphyxia", 0, 0, "L");
        $pdf->Cell(28, 4, ".......", 0, 0, "R");
        $pdf->Cell(70, 4, "", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");

        $pdf->Cell(70, 4, ">=25yrs", 0, 0, "R");
        $pdf->Cell(16, 4, "...$diliveliesabove25...", 0, 0, "R");
        $pdf->Cell(70, 4, "New born deaths (0-7 days)", 0, 0, "L");
        $pdf->Cell(28, 4, ".......", 0, 0, "R");
        $pdf->Cell(70, 4, "", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");

        $pdf->Cell(70, 4, "Spontaneous vaginal delivery(SVD)", 0, 0, "L");
        $pdf->Cell(16, 4, "..$Mode_Deliver...", 0, 0, "R");
        $pdf->Cell(70, 4, "Other Perinatal conditions(in new borns o-28 days)", 0, 0, "L");
        $pdf->Cell(28, 4, ".........", 0, 0, "R");
        $pdf->Cell(70, 4, "", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");

        $pdf->Cell(70, 4, "Ceasarean sections", 0, 0, "L");
        $pdf->Cell(16, 4, "..." . ($totalEmergency + $totalElective) . "....", 0, 0, "R");
        $pdf->Cell(70, 4, "Neonatal deaths", 0, 0, "L");
        $pdf->Cell(28, 4, ".........", 0, 0, "R");
        $pdf->Cell(70, 4, "", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");

        $pdf->Cell(70, 4, "Vaccum extractions", 0, 0, "L");
        $pdf->Cell(16, 4, "......", 0, 0, "R");
        $pdf->Cell(70, 4, "Babies who receved PNC at 6hrs", 0, 0, "L");
        $pdf->Cell(28, 4, ".........", 0, 0, "R");
        $pdf->Cell(70, 4, "", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");

        $pdf->Cell(70, 4, "Ventoiuse", 0, 0, "L");
        $pdf->Cell(16, 4, "......", 0, 0, "R");
        $pdf->Cell(70, 4, "PMTCT", 0, 0, "L");
        $pdf->Cell(28, 4, "", 0, 0, "R");
        $pdf->Cell(70, 4, "", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");

        $pdf->Cell(70, 4, "Breech", 0, 0, "L");
        $pdf->Cell(16, 4, "......", 0, 0, "R");
        $pdf->Cell(70, 4, "Deliveries HIV positive in unit", 0, 0, "L");
        $pdf->Cell(28, 4, "..........", 0, 0, "R");
        $pdf->Cell(70, 4, "", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");

        $pdf->Cell(70, 4, "Multiple gestations", 0, 0, "L");
        $pdf->Cell(16, 4, "......", 0, 0, "R");
        $pdf->Cell(70, 4, "Deliveries HIV positive who swallowed ARVS", 0, 0, "L");
        $pdf->Cell(28, 4, ".......", 0, 0, "R");
        $pdf->Cell(70, 4, "", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");

        $pdf->Cell(70, 4, "Laparatomy", 0, 0, "L");
        $pdf->Cell(16, 4, "......", 0, 0, "R");
        $pdf->Cell(70, 4, "Live births in unit", 0, 0, "L");
        $pdf->Cell(28, 4, "........", 0, 0, "R");
        $pdf->Cell(70, 4, "", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");

        $pdf->Cell(70, 4, "Total deliveries", 0, 0, "L");
        $pdf->Cell(16, 4, "..." . ($dilivelies10_19 + $dilivelies24_25 + $diliveliesabove25) . "..", 0, 0, "R");
        $pdf->Cell(70, 4, "Live births to HIV positive mothers", 0, 0, "L");
        $pdf->Cell(28, 4, ".......", 0, 0, "R");
        $pdf->Cell(70, 4, "", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");

        $pdf->Cell(70, 4, "Ceasarean section rate(CS rate)", 0, 0, "L");
        $pdf->Cell(16, 4, "......", 0, 0, "R");
        $pdf->Cell(70, 4, "Babies(born to HIV positive mothers) given ARVS", 0, 0, "L");
        $pdf->Cell(28, 4, "......", 0, 0, "R");
        $pdf->Cell(70, 4, "", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");

        $pdf->Cell(70, 4, "Number of babies", 0, 0, "L");
        $pdf->Cell(16, 4, "...." . $totaldeadchildren + $totalalivechildren . "....", 0, 0, "R");
        $pdf->Cell(70, 4, "HIV+ mothers initiating breast feeding within first hour", 0, 0, "L");
        $pdf->Cell(28, 4, ".......", 0, 0, "R");
        $pdf->Cell(70, 4, "", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");

        $pdf->Cell(70, 4, "Live babies", 0, 0, "L");
        $pdf->Cell(16, 4, "...$totalalivechildren...", 0, 0, "R");
        $pdf->Cell(70, 4, "Mothers tested for HIV", 0, 0, "L");
        $pdf->Cell(28, 4, "..." . ($t + $tr + $trr + tr1 + $trr1 + $trk + $trrk + $tr3 + $trr3) . "...", 0, 0, "R");
        $pdf->Cell(70, 4, "", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");

        $pdf->Cell(70, 4, "Fresh still birth by CS", 0, 0, "L");
        $pdf->Cell(16, 4, "...$stillBirthFSBQuerycs...", 0, 0, "R");
        $pdf->Cell(70, 4, "Mothers tested HIV teste in maternity", 0, 0, "L");
        $pdf->Cell(28, 4, ".........", 0, 0, "R");
        $pdf->Cell(70, 4, "", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");

        $pdf->Cell(70, 4, "Fresh still birth by CVD", 0, 0, "L");
        $pdf->Cell(16, 4, "......", 0, 0, "R");
        $pdf->Cell(70, 4, "Mothers given Vit A supprement", 0, 0, "L");
        $pdf->Cell(28, 4, ".........", 0, 0, "R");
        $pdf->Cell(70, 4, "", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");

        $pdf->Cell(70, 4, "Macerated still births", 0, 0, "L");
        $pdf->Cell(16, 4, "...$stillBirthMSBQuery...", 0, 0, "R");
        $pdf->Cell(70, 4, "Partners Tested", 0, 0, "L");
        $pdf->Cell(28, 4, "........", 0, 0, "R");
        $pdf->Cell(70, 4, "", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");

        $pdf->Cell(70, 4, "END", 0, 0, "L");
        $pdf->Cell(16, 4, "", 0, 0, "R");
        $pdf->Cell(70, 4, "Deliveries by private practitioners", 0, 0, "L");
        $pdf->Cell(28, 4, ".......", 0, 0, "R");
        $pdf->Cell(70, 4, "", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");

        $pdf->Cell(70, 4, "Abortions(<28 weeks)", 0, 0, "L");
        $pdf->Cell(16, 4, "......", 0, 0, "R");
        $pdf->Cell(70, 4, "Deliveries with TBA", 0, 0, "L");
        $pdf->Cell(28, 4, ".......", 0, 0, "R");
        $pdf->Cell(70, 4, "1. Nursing Officer In-charge of Maternity Ward", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");

        $pdf->Cell(70, 4, "Maralia cases", 0, 0, "L");
        $pdf->Cell(16, 4, "......", 0, 0, "R");
        $pdf->Cell(70, 4, "Maternal Deaths", 0, 0, "L");
        $pdf->Cell(28, 4, "", 0, 0, "R");
        $pdf->Cell(70, 4, ".............................................", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");

        $pdf->Cell(70, 4, "Ulinary tract infections", 0, 0, "L");
        $pdf->Cell(16, 4, "......", 0, 0, "R");
        $pdf->Cell(70, 4, "10-19yrs", 0, 0, "R");
        $pdf->Cell(28, 4, "...$diliveliesdead10_19....", 0, 0, "R");
        $pdf->Cell(70, 4, "2. Medical Officer/Head Obs/Gynae", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");

        $pdf->Cell(70, 4, "Anemia in pregnancy", 0, 0, "L");
        $pdf->Cell(16, 4, "......", 0, 0, "R");
        $pdf->Cell(70, 4, "20-24yrs", 0, 0, "R");
        $pdf->Cell(28, 4, "..$diliveliesdead20_24...", 0, 0, "R");
        $pdf->Cell(70, 4, ".....................................................", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");

        $pdf->Cell(70, 4, "Pre-eclamptic toxemia", 0, 0, "L");
        $pdf->Cell(16, 4, "......", 0, 0, "R");
        $pdf->Cell(70, 4, ">25yrs", 0, 0, "R");
        $pdf->Cell(28, 4, "....$diliveliesadeadbove25....", 0, 0, "R");
        $pdf->Cell(70, 4, "3. Director/Medical suprintendant", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");

        $pdf->Cell(70, 4, "Obstracted labour", 0, 0, "L");
        $pdf->Cell(16, 4, "......", 0, 0, "R");
        $pdf->Cell(70, 4, "Causes of maternal deaths:", 0, 0, "R");
        $pdf->Cell(28, 4, "", 0, 0, "R");
        $pdf->Cell(70, 4, "............................", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");

        $pdf->Cell(70, 4, "Antepartam haemorrhage", 0, 0, "L");
        $pdf->Cell(16, 4, "......", 0, 0, "R");
        $pdf->Cell(70, 4, "", 0, 0, "L");
        $pdf->Cell(28, 4, "", 0, 0, "R");
        $pdf->Cell(70, 4, "4.  Date of report", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");

        $pdf->Cell(70, 4, "Postpartam haemorrhage", 0, 0, "L");
        $pdf->Cell(16, 4, "......", 0, 0, "R");
        $pdf->Cell(70, 4, "", 0, 0, "L");
        $pdf->Cell(28, 4, "", 0, 0, "R");
        $pdf->Cell(70, 4, "...................................................", 0, 0, "L");
        $pdf->Cell(26, 4, "", 0, 1, "R");
    }
    if ($maternity_report_type == "Others") {

        $patientList = "select * from patient,maternity where maternity.Patient_Id=patient.Patient_Id $condition ORDER BY patient.Patient_Id DESC";
        $admissionsQuery = "select * from patient,patient_admission where patient_admission.Patient_Id=patient.Patient_Id AND EDD IS NOT NULL AND substr(patient_admission.Admission_Date,1,10)='$date_selected' ORDER BY patient.Patient_Id DESC";
        $patientEmergencyQuery = "select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id AND Mode_Deliver='Emergency C/Section' $condition ORDER BY patient.Patient_Id DESC";
        $patientSVDQuery = "select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id AND Mode_Deliver='SVD' $condition ORDER BY patient.Patient_Id DESC";
        $patientElectiveQuery = "select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id AND Mode_Deliver='Elective C/Section' $condition ORDER BY patient.Patient_Id DESC";
        $septicsQuery = "select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id AND Mode_Deliver!='SVD' AND Is_Septic='Yes' $condition ORDER BY patient.Patient_Id DESC";
        $totalAdmissions = DB::getInstance()->countElements($admissionsQuery);
        $totalEmergency = DB::getInstance()->countElements($patientEmergencyQuery);
        $totalSVD = DB::getInstance()->countElements($patientSVDQuery);
        $totalElective = DB::getInstance()->countElements($patientElectiveQuery);
        $totalSeptics = DB::getInstance()->countElements($septicsQuery);

        $pdf->AddPage("L");
        $pdf->SetTextColor(180, 0, 16);
        $pdf->createHeader("$hospital_main_title: DEPARTMENT OF OBSTETRICS", 185);
        $pdf->Cell(0, 5, $maternityReportName, 0, 1, "C");
        $pdf->SetTextColor(0, 0, 0);
        $pdf->SetFont("Arial", "B", 6);
        $pdf->Cell(100, 4, "", 0, 0, "L");
        $pdf->Cell(40, 4, "Date", 1, 0, "L");
        $pdf->Cell(40, 4, "", 1, 1, "L");
        $pdf->Cell(100, 4, "", 0, 0, "L");
        $pdf->Cell(40, 4, "", 1, 0, "L");
        $pdf->Cell(40, 4, "", 1, 1, "L");

        $pdf->Cell(40, 5, "Team on call", 0, 1, "L");
        $pdf->SetFont("Arial", "", 7);
        //Total width=280
        $pdf->Cell(70, 5, "Specialist...................", 0, 0, "L");
        $pdf->Cell(100, 5, "SHO:.....................", 0, 0, "L");
        $pdf->Cell(100, 5, "JHO/ Internee:....................", 0, 1, "L");

        $pdf->Cell(70, 5, "Total admissions: ...$totalAdmissions....", 0, 0, "L");
        $pdf->Cell(100, 5, "Obstetrics: ......", 0, 0, "L");
        $pdf->Cell(100, 5, "Sepsis: ...$totalSeptics...", 0, 1, "L");

        $pdf->Cell(70, 5, "Total Deliveries: ..." . ($totalSVD + $totalEmergency + $totalElective) . ".....", 0, 0, "L");
        $pdf->Cell(100, 5, "SVD: ....$totalSVD....", 0, 0, "L");
        $pdf->Cell(100, 5, "Partograms filled: ", 0, 1, "L");

        $pdf->Cell(70, 5, "Total C/Section: ...." . ($totalEmergency + $totalElective) . "....", 0, 0, "L");
        $pdf->Cell(100, 5, "Emergency: ....$totalEmergency.....", 0, 0, "L");
        $pdf->Cell(100, 5, "Elective: ....$totalElective....", 0, 1, "L");
//        Emergence C/Section
        $pdf->SetFont("Arial", "B", 8);
        $pdf->Cell(200, 4, "Emergence C/Section Details", 0, 1, "C");
        $pdf->SetFont("Arial", "", 5);
        $pdf->Cell(8, 8, "No.", 1, 0, "L");
        $pdf->Cell(40, 8, "Name", 1, 0, "L");
        $pdf->Cell(7, 8, "Age", 1, 0, "L");
        $pdf->Cell(8, 8, "Parity", 1, 0, "L");
        $pdf->Cell(13, 8, "Booked (Y/N)", 1, 0, "L");
        $pdf->Cell(40, 8, "Indications", 1, 0, "L");
        $pdf->Cell(20, 8, "Anasthesia", 1, 0, "L");
        $pdf->Cell(27, 8, "Fetal Outcome", 1, 0, "L");
        $pdf->Cell(17, 8, "Maternal Outcome", 1, 0, "L");
        $pdf->Cell(25, 8, "Decision to delivery time", 1, 0, "L");
        $pdf->Cell(40, 8, "Reason for delay", 1, 0, "L");
        $pdf->Cell(40, 4, "Postop Observations", 1, 1, "L");
        $pdf->Cell(245, 4, "", 0, 0, "L");
        $pdf->Cell(20, 4, "1st 4hrs", 1, 0, "L");
        $pdf->Cell(20, 4, "5-24 hrs", 1, 1, "L");

        $pdf->Cell(136, 4, "", 1, 0, "L");
        $pdf->Cell(5, 4, "Wt", 1, 0, "L");
        $pdf->Cell(10, 4, "A/S", 1, 0, "L");
        $pdf->Cell(12, 4, "Age", 1, 0, "L");
        $pdf->Cell(82, 4, "", 1, 0, "L");
        $pdf->Cell(10, 4, "BP", 1, 0, "L");
        $pdf->Cell(10, 4, "PR", 1, 0, "L");
        $pdf->Cell(10, 4, "BP", 1, 0, "L");
        $pdf->Cell(10, 4, "PR", 1, 1, "L");
        //Looping for data
        $patientEmergencyList = DB::getInstance()->querySample($patientEmergencyQuery);
        $no = 0;
        $pdf->SetFont("Arial", "", 7);
        foreach ($patientEmergencyList AS $patientdata) {
            $indications = unserialize($patientdata->Indications);
            $count_indications = sizeof($indications);
            $column_height = ($count_indications > 0) ? ($count_indications * 4) : 4;
            $no++;
            $APGAR_Score = $patientdata->Apger_Score;
            $APGAR_Score .= ($patientdata->Final_apigar_score != "") ? "-" . $patientdata->Final_apigar_score : "";
            $pdf->Cell(8, $column_height, "$no", 1, 0, "L");
            $pdf->Cell(40, $column_height, "$patientdata->Fname  $patientdata->Lname", 1, 0, "L");
            $pdf->Cell(7, $column_height, calculateAge($patientdata->DOB, $date_today), 1, 0, "L");
            $pdf->Cell(8, $column_height, "$patientdata->Parity", 1, 0, "L");
            $pdf->Cell(13, $column_height, "", 1, 0, "L"); //Booked (Y/N)
            $pdf->Cell(40, $column_height, "", 1, 0, "L"); //Indications
            $pdf->Cell(20, $column_height, "", 1, 0, "L"); //Anasthesia
            $pdf->Cell(5, $column_height, "$patientdata->Fetal_Wt", 1, 0, "L"); //Fetal Weight
            $pdf->Cell(10, $column_height, "$APGAR_Score", 1, 0, "L"); //APGAR Score
            $pdf->Cell(12, $column_height, calculateAge($patientdata->DOD, $date_today), 1, 0, "L"); //Fetal Age
            $pdf->Cell(17, $column_height, "$patientdata->Maternal_Outcome", 1, 0, "L"); //Maternal outcome
            $pdf->Cell(25, $column_height, "", 1, 0, "L"); //Decision to delivery time
            $pdf->Cell(40, $column_height, "", 1, 0, "L"); //Reason for delay
            $pdf->Cell(10, $column_height, "", 1, 0, "L"); //BP
            $pdf->Cell(10, $column_height, "", 1, 0, "L"); //PR
            $pdf->Cell(10, $column_height, "", 1, 0, "L"); //BP
            $pdf->Cell(10, $column_height, "", 1, 1, "L"); //PR
            for ($x = 0; $x < count($indications); $x++) {
                $pdf->Cell(76, -4, "", 0, 0, "L");
                $pdf->Cell(40, -4, $indications[$x], 0, 1, "L");
            }

            $pdf->Cell(0, $column_height, "", 0, 1, "L");
        }
        //Emergence Laparatomy
        $pdf->SetFont("Arial", "B", 8);
        $pdf->Cell(200, 10, "Emergence Laparatomy (Raptured Uterus)", 0, 1, "C");
        $pdf->SetFont("Arial", "", 7);
        $pdf->Cell(10, 8, "No.", 1, 0, "L");
        $pdf->Cell(50, 8, "Name", 1, 0, "L");
        $pdf->Cell(10, 8, "Age", 1, 0, "L");
        $pdf->Cell(10, 8, "Parity", 1, 0, "L");
        $pdf->Cell(55, 8, "Indications", 1, 0, "L");
        $pdf->Cell(30, 8, "Anasthesia", 1, 0, "L");
        $pdf->Cell(30, 8, "Operation", 1, 0, "L");
        $pdf->Cell(30, 8, "Fetal Outcome", 1, 0, "L");
        $pdf->Cell(20, 8, "Maternal Outcome", 1, 0, "L");
        $pdf->Cell(40, 4, "Postop Observations", 1, 1, "L");
        $pdf->Cell(245, 4, "", 0, 0, "L");
        $pdf->Cell(20, 4, "1st 4hrs", 1, 0, "L");
        $pdf->Cell(20, 4, "5-24 hrs", 1, 1, "L");

        $pdf->Cell(195, 4, "", 1, 0, "L");
        $pdf->Cell(8, 4, "Wt", 1, 0, "L");
        $pdf->Cell(10, 4, "A/S", 1, 0, "L");
        $pdf->Cell(12, 4, "Age", 1, 0, "L");
        $pdf->Cell(20, 4, "", 1, 0, "L");
        $pdf->Cell(10, 4, "BP", 1, 0, "L");
        $pdf->Cell(10, 4, "PR", 1, 0, "L");
        $pdf->Cell(10, 4, "BP", 1, 0, "L");
        $pdf->Cell(10, 4, "PR", 1, 1, "L");

        //Data Here
        //comes from either antenatal or gynecology
        //Table for elective gynecology operations
        //Referrals
        $patientReferralsQuery = "select * from person,patient,maternity where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id AND Referred_In='yes' $condition ORDER BY patient.Patient_Id DESC";
        $totalReferrals = DB::getInstance()->countElements($patientReferralsQuery);
        $pdf->SetFont("Arial", "B", 8);
        $pdf->Cell(200, 10, "Number of referrals:.....$totalReferrals......", 0, 1, "C");
        $pdf->SetFont("Arial", "", 7);
        $pdf->Cell(10, 8, "No.", 1, 0, "L");
        $pdf->Cell(60, 8, "Name", 1, 0, "L");
        $pdf->Cell(10, 8, "Age", 1, 0, "L");
        $pdf->Cell(15, 8, "Parity", 1, 0, "L");
        $pdf->Cell(60, 8, "Reason for referral", 1, 0, "L");
        $pdf->Cell(60, 8, "Referring unit", 1, 0, "L");
        $pdf->Cell(40, 4, "Fetal Outcome", 1, 0, "L");
        $pdf->Cell(30, 8, "Maternal Outcome", 1, 1, "L");

        $pdf->Cell(215, -4, "", 0, 0, "L");
        $pdf->Cell(12, -4, "Wt", 1, 0, "L");
        $pdf->Cell(13, -4, "A/S", 1, 0, "L");
        $pdf->Cell(15, -4, "Age", 1, 1, "L");
        $pdf->Cell(0, 4, "", 0, 1, "L");

        //Data for referrals
        $patientReferralsList = DB::getInstance()->querySample($patientReferralsQuery);
        $no = 0;
        foreach ($patientReferralsList AS $patientdata) {
            $no++;
            $APGAR_Score = $patientdata->Apger_Score;
            $APGAR_Score .= ($patientdata->Final_apigar_score != "") ? "-" . $patientdata->Final_apigar_score : "";
            $pdf->Cell(10, 4, "$no", 1, 0, "L");
            $pdf->Cell(60, 4, "$patientdata->Fname  $patientdata->Lname", 1, 0, "L");
            $pdf->Cell(10, 4, calculateAge($patientdata->DOB, $date_today), 1, 0, "L");
            $pdf->Cell(15, 4, "$patientdata->Parity", 1, 0, "L");
            $pdf->Cell(60, 4, "$patientdata->Referring_Reason", 1, 0, "L"); //Reason for referral
            $pdf->Cell(60, 4, "$patientdata->Referring_Center", 1, 0, "L"); //Referring center
            $pdf->Cell(12, 4, "$patientdata->Fetal_Wt", 1, 0, "L"); //Fetal Weight
            $pdf->Cell(13, 4, "$APGAR_Score", 1, 0, "L"); //APGAR Score
            $pdf->Cell(15, 4, calculateAge($patientdata->DOD, $date_today), 1, 0, "L"); //Fetal Age
            $pdf->Cell(30, 4, "$patientdata->Maternal_Outcome", 1, 1, "L"); //Maternal outcome
        }

        //Maternal Deaths
        $maternalDeathsQuery = "select * from person,patient,maternity,patient_admission where patient.Person_Id=person.Person_Id AND maternity.Patient_Id=patient.Patient_Id AND patient_admission.Patient_Id=patient.Patient_Id AND Maternal_Outcome='Dead' $condition ORDER BY patient.Patient_Id DESC";
        $totalMaternalDeaths = DB::getInstance()->countElements($maternalDeathsQuery);
        $pdf->SetFont("Arial", "B", 8);
        $pdf->Cell(200, 10, "Number of maternal deaths:.....$totalMaternalDeaths......", 0, 1, "C");
        $pdf->SetFont("Arial", "", 7);
        $pdf->Cell(10, 8, "No.", 1, 0, "L");
        $pdf->Cell(60, 8, "Name", 1, 0, "L");
        $pdf->Cell(10, 8, "Age", 1, 0, "L");
        $pdf->Cell(25, 8, "Parity", 1, 0, "L");
        $pdf->Cell(25, 8, "WOA", 1, 0, "L");
        $pdf->Cell(60, 8, "Probable cause of death", 1, 0, "L");
        $pdf->Cell(60, 8, "Length of stay in hospital", 1, 0, "L");
        $pdf->Cell(35, 8, "Postmotem Findings", 1, 1, "L");

        //Data for Maternal Death
        $maternalDeathsList = DB::getInstance()->querySample($maternalDeathsQuery);
        $no = 0;
        foreach ($maternalDeathsList AS $patientdata) {
            $no++;
            $singleAdmissionQuery = "select * from patient,patient_admission,maternity where maternity.Patient_Id=patient.Patient_Id AND patient_admission.Patient_Id=patient.Patient_Id AND EDD IS NOT NULL AND patient_admission.Patient_Id='$patientdata->Patient_Id' AND substr(patient_admission.Admission_Date,1,10)='$date_selected' ORDER BY patient.Patient_Id DESC";
            $admissionDate = $patientdata->Admission_Date;
            $dischargeDate = ($patientdata->Discharge_Date == "") ? $date_today : $patientdata->Discharge_Date;
            $pdf->Cell(10, 4, "$no", 1, 0, "L");
            $pdf->Cell(60, 4, "$patientdata->Fname  $patientdata->Lname", 1, 0, "L");
            $pdf->Cell(10, 4, calculateAge($patientdata->DOB, $date_today), 1, 0, "L");
            $pdf->Cell(25, 4, "$patientdata->Parity", 1, 0, "L");
            $pdf->Cell(25, 4, "$patientdata->WOA", 1, 0, "L"); //WOA
            $pdf->Cell(60, 4, "$patientdata->Maternal_Death_Cause", 1, 0, "L"); //Cause of death
            $pdf->Cell(60, 4, calculateAge($admissionDate, $dischargeDate), 1, 0, "L"); //Length of stay in hospital
            $pdf->Cell(35, 4, "", 1, 1, "L"); //Postmotem findings
        }
    }
    $pdf->AutoPrint();
    $pdf->Output();
    // $pdf->output('D', $maternityReportName . ' ' . date("Ymdhis") . '.pdf');
} else
if (($_GET['type']) && ($_GET['type'] == "download_maternity_admission_pdf")) {
    $patient_id = Input::get('patient_id');
    $ipd = Input::get('ipd');

    $person_id = DB::getInstance()->displayTableColumnValue("select * from patient where Patient_Id=$patient_id", "Person_Id");
//    $pick_this_patient_details = DB::getInstance()->displayTableColumnValue("select * from person where Patient_Id=$person_id ","Perso");
    $pdf->AddPage();
    $pdf->SetTextColor(180, 0, 16);

    $pdf->createHeader("DEPARTMENT OF MATERNAL HEALTH", 185);
    $pdf->Cell(0, 5, "PATIENT ADMISSION FORM", 0, 1, "C");
    $pdf->SetTextColor(0, 0, 0);
    //names and sex
    $pdf->SetFont("Arial", "B", 8);
    $pdf->Cell(40, 10, "PATIENT NAMES:  ", 1, 0, "L");
    $pdf->SetFont("Arial", "", 8);
    $pdf->Cell(70, 10, DB::getInstance()->getName('person', $person_id, 'Fname', 'Person_Id') . '  ' . DB::getInstance()->getName('person', $person_id, 'Lname', 'Person_Id'), 1, 0, "C");
    $pdf->SetFont("Arial", "B", 8);
    $pdf->Cell(20, 10, "GENDER: ", 1, 0, "L");
    $pdf->SetFont("Arial", "", 8);
    $pdf->Cell(60, 10, DB::getInstance()->getName('person', $person_id, 'Gender', 'Person_Id'), 1, 1, "C");
    //National id number
    $pdf->SetFont("Arial", "B", 8);
    $pdf->Cell(40, 10, "NATIONAL ID NUMBER: ", 1, 0, "L");
    $pdf->SetFont("Arial", "", 8);
    $pdf->Cell(150, 10, DB::getInstance()->getName('person', $person_id, 'Identity_Card', 'Person_Id'), 1, 1, "L");

    $pdf->SetFont("Arial", "B", 8);
    $pdf->Cell(40, 10, "CONTACT ADDRESS: ", 0, 0, "L");
    $pdf->Cell(70, 10, " PERMANENT ADDRESS", 0, 0, "L");
    $pdf->SetFont("Arial", "", 8);
    $pdf->Cell(80, 10, DB::getInstance()->getName('person', $person_id, 'Residence', 'Person_Id') . ' , ' . DB::getInstance()->getName('person', $person_id, 'Village', 'Person_Id') . ' , ' . DB::getInstance()->getName('person', $person_id, 'Subcounty', 'Person_Id'), 1, 1, "L");
    $pdf->Line(50, 40, 50, 95);
    $pdf->Line(10, 40, 10, 95);
//    $pdf->Cell(0,20," ",1,0,"L");

    $pdf->Cell(40, 10, " ", 0, 0, "L");
    $pdf->Cell(70, 10, " ", 0, 0, "L");
    $pdf->Cell(80, 10, DB::getInstance()->getName('person', $person_id, 'District', 'Person_Id'), 1, 1, "L");

    $pdf->Cell(40, 10, " ", 0, 0, "L");
    $pdf->SetFont("Arial", "B", 8);
    $pdf->Cell(70, 10, " TELEPHONE NUMBER", 1, 0, "L");
    $pdf->SetFont("Arial", "", 8);
    $pdf->Cell(80, 10, DB::getInstance()->getName('person', $person_id, 'Phone_Number', 'Person_Id'), 1, 1, "L");

    $pdf->SetFont("Arial", "B", 8);
    $pdf->Cell(40, 10, " DATE OF BIRTH ", 1, 0, "L");
    $pdf->SetFont("Arial", "", 8);
    $pdf->Cell(150, 10, DB::getInstance()->getName('person', $person_id, 'DOB', 'Person_Id'), 1, 1, "L");
    $pdf->SetFont("Arial", "B", 10);
    $pdf->Cell(0, 8, "Compiled by:...................", 0, 1, "L");
    $pdf->AutoPrint();
    $pdf->Output();
    // $pdf->output('D', 'DEPARTMENT OF MATERNITY PATIENT ADMISSION FORM' . ' ' . date("Ymdhis") . '.pdf');
} else {
    redirect("We are unable to process your request at this time", "index.php?page=" . $crypt->encode("dashboard"));
}
?>
