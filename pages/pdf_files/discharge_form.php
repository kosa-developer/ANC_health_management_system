<?php

require ('pdf_header.php');
$pdf = new PDF();
$pdf->AliasNbPages();

$line_height = 30;
if (isset($_GET['form_type']) && ($_GET['form_type'] == "inpatient") || ($_GET['form_type'] == "medical") || ($_GET['form_type'] == "emergency") || ($_GET['form_type'] == "paeditric")) {
    $admission_id = $crypt->decode($_GET['admission_id']);
    $admissionsQuery = "SELECT * FROM patient_admission,patient,person WHERE person.Person_Id=patient.Person_Id AND patient.Patient_Id=patient_admission.Patient_Id AND patient_admission.Admission_Id='$admission_id'";
    $admissionsList = DB::getInstance()->querySample($admissionsQuery);
    $pdf->AddPage();
    $pdf->SetTextColor(180, 0, 16);
    $pdf->createHeader("FORM 051: INPATIENT TREATMENT SHEET", 185);
    $pdf->SetTextColor(0, 0, 0);
    $pdf->SetFont("Arial", "", 9);
    $pdf->SetDash(0.2, 1);
    $line_height = 37;
    foreach ($admissionsList AS $admissions) {
        $pdf->SetFont("Arial", "", 9);
        $pdf->Cell(5, 7, "", 0, 1, "L");
        $pdf->Cell(10, 7, "Ward", 0, 0, "L");
        $pdf->SetFont("Arial", "", 10);
        $pdf->Line(20, $line_height, 60, $line_height);
        $pdf->SetFont("Arial", "", 9);
        $pdf->Cell(40, 7, $admissions->Ward_Assigned, 0, 0, "L");
        $pdf->Cell(10, 7, "Name", 0, 0, "L");
        $pdf->Line(69, $line_height, 130, $line_height);
        $pdf->Cell(60, 7, $admissions->Fname . '  ' . $admissions->Lname, 0, 0, "L");
        $pdf->Cell(25, 7, "Inpatient Number", 0, 0, "L");
        $pdf->Line(155, $line_height, 195, $line_height);
        $pdf->Cell(54, 7, $admissions->Patient_Number, 0, 1, "L");


        $pdf->Cell(10, 7, "Age", 0, 0, "L");
        $pdf->SetFont("Arial", "", 10);
        $pdf->Line(17, $line_height + 7, 60, $line_height + 7);
        $pdf->SetFont("Arial", "", 9);
        $pdf->Cell(40, 7, calculateAge(DB::getInstance()->getName("person", $admissions->Person_Id, "DOB", "Person_Id"), $date_today), 0, 0, "L");
        $pdf->Cell(10, 7, "Sex", 0, 0, "L");
        $pdf->Line(67, $line_height + 7, 90, $line_height + 7);
        $pdf->Cell(20, 7, DB::getInstance()->getName("person", $admissions->Person_Id, "Gender", "Person_Id"), 0, 0, "L");
        $pdf->Cell(35, 7, "Next of kin information", 0, 0, "L");
        $pdf->Line(123, $line_height + 7, 195, $line_height + 7);
        $pdf->Cell(54, 7, $admissions->Next_Of_Kin, 0, 1, "L");


        $pdf->Cell(25, 7, "Admission date", 0, 0, "L");
        $pdf->SetFont("Arial", "", 10);
        $pdf->Line(32, $line_height + (7 * 2), 76, $line_height + (7 * 2));
        $pdf->SetFont("Arial", "", 9);
        $pdf->Cell(40, 7, english_date($admissions->Admission_Date), 0, 0, "L");
        $pdf->Cell(10, 7, "Time", 0, 0, "L");
        $pdf->Line(83, $line_height + (7 * 2), 105, $line_height + (7 * 2));
        $pdf->Cell(20, 7, english_time($patientdata->Time), 0, 0, "L");
        $pdf->Cell(35, 7, "Referred from", 0, 0, "L");
        $pdf->Line(126, $line_height + (7 * 2), 195, $line_height + (7 * 2));
        $pdf->Cell(54, 7, $admissions->Admission_Referring_center, 0, 1, "L");

        $pdf->Cell(25, 7, "Discharge date", 0, 0, "L");
        $pdf->SetFont("Arial", "", 10);
        $pdf->Line(33, $line_height + (7 * 3), 75, $line_height + (7 * 3));
        $pdf->SetFont("Arial", "", 9);
        $pdf->Cell(40, 7, english_date($admissions->Discharge_Date), 0, 0, "L");
        $pdf->Cell(30, 7, "Status of discharge", 0, 0, "L");
        $pdf->Line(104, $line_height + (7 * 3), 195, $line_height + (7 * 3));
        $pdf->Cell(15, 7, $admissions->Status_At_Discharge, 0, 1, "L");

        $pdf->Cell(30, 7, "Final Diagnoses", 0, 0, "L");

        $final_diagnosis = "";
        $final_diagnosis_array = unserialize($admissions->Final_Diagnosis);
        for ($i = 0; $i < count($final_diagnosis_array); $i++) {
            $final_diagnosis .= ($i != count($final_diagnosis_array) - 1) ? $final_diagnosis_array[$i] . ", " : $final_diagnosis_array[$i];
        }
        $pdf->Line(34, $line_height + (7 * 4), 195, $line_height + (7 * 4));
        $pdf->Line(12, $line_height + (7 * 5), 195, $line_height + (7 * 5));

        $pdf->Write(7, " " . $final_diagnosis . "        ");
        $pdf->Cell(0, 14, "", 0, 1, "L");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "Surgical procedures:  ");

        $procedure_taken = "";
        $procedure_taken_array = unserialize($admissions->Procedure_Taken);
        for ($i = 0; $i < count($procedure_taken_array); $i++) {
            $procedure_taken .= ($i != count($procedure_taken_array) - 1) ? $procedure_taken_array[$i] . ", " : $procedure_taken_array[$i];
        }
        $pdf->Line(40, $line_height + (7 * 6), 195, $line_height + (7 * 6));
        $pdf->Line(12, $line_height + (7 * 7), 195, $line_height + (7 * 7));

        $pdf->Write(7, "  " . $procedure_taken . "  ");
        $pdf->Cell(0, 14, "", 0, 1, "L");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "Special services:  ");
        $pdf->Line(35, $line_height + (7 * 8), 195, $line_height + (7 * 8));

        $pdf->Write(7, $admissions->Special_Services . "                    ");
        $pdf->Cell(0, 7, "", 0, 1, "L");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, " If followup needed after discharge, date: ");

        $folloup_date = ($admissions->Next_Follow_Up_Date != "") ? english_date($admissions->Next_Follow_Up_Date) : "";
        $pdf->Line(70, $line_height + (7 * 9), 95, $line_height + (7 * 9));

        $pdf->Write(7, "    " . $folloup_date . "        ");
        $pdf->SetFont("Arial", "", 9);

        $pdf->Write(7, " Place ");


        $pdf->Line(104, $line_height + (7 * 9), 195, $line_height + (7 * 9));

        $pdf->Write(7, " ");
        $pdf->Cell(0, 7, "", 0, 1, "L");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, " Treatment instructions after discharge: ");

        $pdf->Line(66, $line_height + (7 * 10), 195, $line_height + (7 * 10));
        $pdf->Line(12, $line_height + (7 * 11), 195, $line_height + (7 * 11));
        $pdf->Write(7, $admissions->Treatment_Instructions . " ");
        $pdf->Cell(0, 14, "", 0, 1, "L");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, " CLINICAL NOTES: ");

        $pdf->Line(40, $line_height + (7 * 12), 195, $line_height + (7 * 12));
        $pdf->Line(12, $line_height + (7 * 13), 195, $line_height + (7 * 13));
        $pdf->Write(7, $admissions->Clinical_Notes . " ");
        $pdf->Cell(0, 14, "", 0, 1, "L");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, " Provisional diagnosis ");

        $provisional_diagnosis = "";
        $provisional_diagnosis_array = unserialize($admissions->Provisional_Diagnosis);
        for ($i = 0; $i < count($provisional_diagnosis_array); $i++) {
            $provisional_diagnosis .= ($i != count($provisional_diagnosis_array) - 1) ? $provisional_diagnosis_array[$i] . ", " : $provisional_diagnosis_array[$i];
        }
        $pdf->Line(42, $line_height + (7 * 14), 195, $line_height + (7 * 14));
        $pdf->Line(12, $line_height + (7 * 16), 195, $line_height + (7 * 16));
        $pdf->Write(7, "   " . $provisional_diagnosis . "        ");
        $pdf->Cell(0, 14, "", 0, 1, "L");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, " LABORATORY AND X-RAY FINDINGS: ");

        $pdf->Line(68, $line_height + (7 * 16), 195, $line_height + (7 * 16));
        $pdf->Line(12, $line_height + (7 * 17), 195, $line_height + (7 * 17));

        $provisional_findings = "";
        $provisional_findings_array = unserialize($admissions->Findings);
        for ($i = 0; $i < count($provisional_findings_array); $i++) {
            $provisional_findings .= ($i != count($provisional_findings_array) - 1) ? $provisional_findings_array[$i] . ", " : $provisional_diagnosis_array[$i];
        }

        $pdf->Write(7, $provisional_findings . "              ");
    }
    $pdf->AutoPrint();
    $pdf->Output();
    //$pdf->output('D', 'Discharge form for '.$admissions->Fname . '   ' . $admissions->Lname.'  ' . date("Y-m-d h i s") . '.pdf');
} else
if (isset($_GET['form_type']) && ($_GET['form_type'] == "gynecology")) {
    $admission_id = $crypt->decode($_GET['admission_id']);
    $admissionsQuery = "SELECT * FROM patient_admission,patient,person WHERE person.Person_Id=patient.Person_Id AND patient.Patient_Id=patient_admission.Patient_Id AND patient_admission.Admission_Id='$admission_id'";
    $admissionsList = DB::getInstance()->querySample($admissionsQuery);
    $pdf->AddPage();
    $pdf->SetTextColor(180, 0, 16);
    $pdf->createHeader("GYNECOLOGY DISCHARGE FORM", 185);
    $pdf->SetTextColor(0, 0, 0);
    $pdf->SetFont("Arial", "", 9);
    $pdf->SetDash(0.2, 1);
    $line_height = 30;

    foreach ($admissionsList AS $admissions) {
        $discharged_by = DB::getInstance()->displayTableColumnValue("SELECT CONCAT(person.Fname,' ',person.Lname) AS Full_Name FROM  staff, person WHERE staff.Person_Id=person.Person_Id AND  staff.Staff_Id='$admissions->Discharged_By'", "Full_Name");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "PATIENT NAMES:  ");

        $pdf->Line(37, $line_height, 97, $line_height);
        $pdf->Write(7, "  " . $admissions->Fname . '     ' . $admissions->Lname . "                                                   ");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "IP No: ");

        $pdf->Line(105, $line_height, 195, $line_height);
        $pdf->Write(7, "  " . $admissions->Patient_Number . "                           ");

        $pdf->Cell(0, 7, "", 0, 1, "L");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, " AGE: ");

        $pdf->Line(19, $line_height + (7 * 1), 59, $line_height + (7 * 1));
        $pdf->Write(7, "  " . calculateAge(DB::getInstance()->getName("person", $admissions->Person_Id, "DOB", "Person_Id"), $date_today) . "                                ");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, " SEX:      ");

        $pdf->Line(65, $line_height + (7 * 1), 101, $line_height + (7 * 1));
        $pdf->Write(7, "  " . DB::getInstance()->getName("person", $admissions->Person_Id, "Gender", "Person_Id") . "                                   ");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "DOA:    ");

        $pdf->Line(121, $line_height + (7 * 1), 149, $line_height + (7 * 1));
        $pdf->Write(7, "  " . english_date($admissions->Admission_Date) . "             ");

        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "DOD ");

        $pdf->Line(160, $line_height + (7 * 1), 195, $line_height + (7 * 1));
        $pdf->Write(7, "  " . english_date($admissions->Discharge_Date) . "                        ");

        // $pdf->Cell(0, 7, "", 0, 1, "L");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "Final Diagnosis: ");

        $final_diagnosis = "";
        $final_diagnosis_array = unserialize($admissions->Final_Diagnosis);
        for ($i = 0; $i < count($final_diagnosis_array); $i++) {
            $final_diagnosis .= ($i != count($final_diagnosis_array) - 1) ? $final_diagnosis_array[$i] . ", " : $final_diagnosis_array[$i];
        }
        $pdf->Line(35, $line_height + (7 * 2), 195, $line_height + (7 * 2));
        $pdf->Line(12, $line_height + (7 * 3), 195, $line_height + (7 * 3));
        $pdf->Write(7, "   " . $final_diagnosis . "        ");
        $pdf->Cell(0, 14, "", 0, 1, "L");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "Ci Summary:  ");

        $pdf->Line(30, $line_height + (7 * 4), 195, $line_height + (7 * 4));
        $pdf->Line(12, $line_height + (7 * 5), 195, $line_height + (7 * 5));
        $pdf->Line(12, $line_height + (7 * 6), 195, $line_height + (7 * 6));
        $pdf->Line(12, $line_height + (7 * 7), 195, $line_height + (7 * 7));
        $pdf->Write(7, "$admissions->Clinical_Notes");
        $pdf->Cell(0, 7 * 2, "", 0, 1, "L");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "Tests done:  ");
        $pdf->Line(27, $line_height + (7 * 8), 195, $line_height + (7 * 8));
        $pdf->Line(12, $line_height + (7 * 9), 195, $line_height + (7 * 9));

        $pdf->Write(7, " ");
        $pdf->Cell(0, 7 * 2, "", 0, 1, "L");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(6, "Treatment given:  ");
        $treatment_given = "";
        $investigations = "";
        $investigations_array = unserialize($admissions->Investigations);
        $inv_names = $investigations_array[0];
        $inv_details = $investigations_array[1];
        for ($i = 0; $i < count($inv_names); $i++) {
            $inv_data = $inv_names[$i] . " (" . $inv_details[$i] . ")";
            $investigations .= ($i != count($inv_names) - 1) ? $inv_data . ", " : $inv_data;
        }
        $treatment_given_array = unserialize($admissions->Treatment_Given);
        for ($i = 0; $i < count($treatment_given_array); $i++) {
            $treatment_given .= $treatment_given_array[$i];
            $treatment_given .= ($treatment_given_array[$i] == "IV Fluids") ? ": " . $admissions->IV_Fluids : (($treatment_given_array[$i] == "Blood transfusion") ? ": " . $admissions->No_Of_Units . " units" : (($treatment_given_array[$i] == "Family Planning Method") ? ": " . $admissions->Family_Planning_Method : (($treatment_given_array[$i] == "Investigations") ? ": " . $investigations : "")));
            $treatment_given .= ($i != count($treatment_given_array) - 1) ? ", " : "";
        }
        $pdf->Line(35, $line_height + (7 * 10), 195, $line_height + (7 * 10));
        $pdf->Line(12, $line_height + (7 * 11), 195, $line_height + (7 * 11));
        $pdf->Line(12, $line_height + (7 * 12), 195, $line_height + (7 * 12));
        $pdf->Write(7, "   " . $treatment_given . "  ");
        $pdf->Cell(0, 7, "", 0, 1, "L");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "Outcome:  ");
        $pdf->Line(25, $line_height + (7 * 13), 195, $line_height + (7 * 13));
        $pdf->Write(7, "  " . $admissions->Status_At_Discharge . "                    \n");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "Discharged on:  ");
        $pdf->SetFont("Arial", "", 9);

        $pdf->Line(33, $line_height + (7 * 14), 95, $line_height + (7 * 14));
        $pdf->Write(7, "  " . english_date($admissions->Discharge_Date) . "                                               ");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "Next Review (date): ");
        $folloup_date = ($admissions->Next_Follow_Up_Date != "") ? english_date($admissions->Next_Follow_Up_Date) : "";
        $pdf->Line(123, $line_height + (7 * 14), 195, $line_height + (7 * 14));
        $pdf->Write(7, "  " . $folloup_date . "        \n");
        //Discharge Plan
        $pdf->SetFont("Arial", "B", 10);
        $pdf->Cell(0, 7, "DISCHARGE PLAN", 0, 1, "L");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "Revisit Ward Date: ");
        $revisit_date = ($admissions->Revisit_Date != "") ? english_date($admissions->Revisit_Date) : "";
        $pdf->Line(38, $line_height + (7 * 16), 66, $line_height + (7 * 16));

        $pdf->Write(7, "  " . $revisit_date . "                                 ");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "Referral to health facility:  ");
        $pdf->Line(105, $line_height + (7 * 16), 142, $line_height + (7 * 16));
        $pdf->Write(7, "  " . $admissions->Referred_Out_Center . "                                       ");

        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "Referral date:  ");
        $pdf->Line(155, $line_height + (7 * 16), 195, $line_height + (7 * 16));

        $pdf->Write(7, "  " . $admissions->Referral_Date . "         \n");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "Clinical Appointment:  ");
        $pdf->Line(40, $line_height + (7 * 17), 80, $line_height + (7 * 17));

        $pdf->Write(7, "  " . $admissions->Clinical_Appointment . "                                            ");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "Appointment Date:  ");
        $appointment_date = ($admissions->Appointment_Date != "") ? english_date($admissions->Appointment_Date) : "";
        $pdf->Line(110, $line_height + (7 * 17), 195, $line_height + (7 * 17));

        $pdf->Write(7, "  " . $appointment_date . "        \n");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "Discharged by: ");
        $pdf->Line(35, $line_height + (7 * 18), 195, $line_height + (7 * 18));

        $pdf->Write(7, "   " . $discharged_by . "$admissions->Discharged_By \n");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Line(30, $line_height + (7 * 18), 195, $line_height + (7 * 18));

        $pdf->Write(7, " Signature:");
    }
    $pdf->AutoPrint();
    $pdf->Output();
    // $pdf->output('D', 'Discharge form ' . date("Ymdhis") . '.pdf');
} else
if (isset($_GET['form_type']) && ($_GET['form_type'] == "postnatal")) {
    $admission_id = $crypt->decode($_GET['admission_id']);
    $admissionsQuery = "SELECT * FROM patient_admission,patient,person WHERE person.Person_Id=patient.Person_Id AND patient.Patient_Id=patient_admission.Patient_Id AND patient_admission.Admission_Id='$admission_id'";
    $admissionsList = DB::getInstance()->querySample($admissionsQuery);
    $pdf->AddPage();
    $pdf->SetDash(0.2, 1);
    $pdf->SetTextColor(180, 0, 16);
    $pdf->createHeader("POSTNATAL DISCHARGE FORM", 185);
    $pdf->SetTextColor(0, 0, 0);
    $pdf->SetFont("Arial", "", 9);
    foreach ($admissionsList AS $admissions) {
        $discharged_by = DB::getInstance()->displayTableColumnValue("SELECT CONCAT(person.Fname,' ',person.Lname) AS Full_Name FROM  staff, person WHERE staff.Person_Id=person.Person_Id AND staff.Staff_Id='$admissions->Discharged_By'", "Full_Name");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "PATIENT NAMES:     ");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Line(37, $line_height, 87, $line_height);
        $pdf->Write(7, "$admissions->Fname   $admissions->Lname                                  ");

        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "IP No:   ");
        $pdf->SetFont("Arial", "", 9);

        $pdf->Line(97, $line_height, 121, $line_height);
        $pdf->Write(7, "$admissions->Patient_Number                    ");
        $pdf->SetFont("Arial", "", 9);

        $pdf->Write(7, "AGE: ");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Line(131, $line_height, 153, $line_height);
        $pdf->Write(7, calculateAge(DB::getInstance()->getName("person", $admissions->Person_Id, "DOB", "Person_Id"), $date_today) . "            ");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "Ward:   ");
        $pdf->SetFont("Arial", "", 9);

        $pdf->Line(162, $line_height, 195, $line_height);
        $pdf->Write(7, $admissions->Ward_Assigned . "\n");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "D.O.A: ");

        $pdf->SetFont("Arial", "", 9);
        $pdf->Line(19, $line_height + 7, 95, $line_height + 7);
        $pdf->Write(7, english_date($admissions->Admission_Date) . "                                                                 ");

        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "D.O Discharge:   ");
        $pdf->SetFont("Arial", "", 9);

        $pdf->Line(115, $line_height + 7, 195, $line_height + 7);
        $pdf->Write(7, english_date($admissions->Discharge_Date) . "\n");
        $deliveryDataList = DB::getInstance()->querySample("SELECT * FROM maternity WHERE Patient_Id='$admissions->Patient_Id' LIMIT 1");
        foreach ($deliveryDataList AS $patientdata) {
            $pdf->SetFont("Arial", "", 9);
            $pdf->Write(7, "D.O Delivery: ");
            $pdf->SetFont("Arial", "", 9);

            $pdf->Line(30, $line_height + (7 * 2), 70, $line_height + (7 * 2));

            $pdf->Write(7, english_date($patientdata->DOD) . "                       ");
            $pdf->SetFont("Arial", "", 9);


            $pdf->Write(7, "Time:  ");
            $pdf->SetFont("Arial", "", 9);
            $pdf->Line(77, $line_height + (7 * 2), 117, $line_height + (7 * 2));
            $pdf->Write(7, english_time($patientdata->DOD) . "                         ");

            $pdf->SetFont("Arial", "", 9);
            $pdf->Write(7, "Mode of delivery:    ");
            $pdf->SetFont("Arial", "", 9);
            $pdf->Line(142, $line_height + (7 * 2), 195, $line_height + (7 * 2));
            $pdf->Write(7, $patientdata->Mode_Deliver . "\n");
            if ($patientdata->Mode_Deliver != "SVD") {
                $indications = "";
                $indications_array = unserialize($patientdata->Indications);
                for ($i = 0; $i < count($indications_array); $i++) {
                    $indications .= ($i != count($indications_array) - 1) ? $indications_array[$i] . ", " : $indications_array[$i];
                }
                $pdf->SetFont("Arial", "", 9);
                $pdf->Write(7, "Indications: ");

                $pdf->Line(30, $line_height + (7 * 3), 195, $line_height + (7 * 3));
                $pdf->Line(12, $line_height + (7 * 4), 195, $line_height + (7 * 4));

                $pdf->Write(7, "   $indications     \n\n");
            }

            $pdf->SetFont("Arial", "", 9);
            $pdf->Write(7, "Baby gender:  ");
            $pdf->Line(30, $line_height + (7 * 5), 74, $line_height + (7 * 5));
            $pdf->Write(7, "   $patientdata->Fetal_Sex                                             ");
            $pdf->SetFont("Arial", "", 9);
            $pdf->Write(7, "Birth weight: ");

            $pdf->Line(92, $line_height + (7 * 5), 140, $line_height + (7 * 5));
            $pdf->Write(7, "  $patientdata->Fetal_Wt kgs                                           ");
            $pdf->SetFont("Arial", "", 9);
            $pdf->Write(7, "APGAR Score: ");

            $APGAR_Score = $patientdata->Apger_Score;
            $APGAR_Score .= ($patientdata->Final_apigar_score != "") ? "-" . $patientdata->Final_apigar_score : "";

            $pdf->Line(162, $line_height + (7 * 5), 195, $line_height + (7 * 5));
            $pdf->Write(7, "  $APGAR_Score \n");
        }
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "Condition Baby:   ");

        $pdf->Line(33, $line_height + (7 * 6), 80, $line_height + (7 * 6));

        $pdf->Write(7, "  $admissions->Baby_Condition_At_Discharge                                      ");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "Mother:   ");

        $pdf->Line(95, $line_height + (7 * 6), 195, $line_height + (7 * 6));

        $pdf->Write(7, "   $admissions->Mother_Condition_At_Discharge \n");
        //breast feeding
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "Infant feeding option selected:  ");

        $pdf->Line(55, $line_height + (7 * 7), 110, $line_height + (7 * 7));
        $pdf->Write(7, "  $admissions->Infant_Feeding                                            ");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "FP services/ information given: ");

        $treatment_given_array = unserialize($admissions->Treatment_Given);
        $pdf->Line(155, $line_height + (7 * 7), 195, $line_height + (7 * 7));

        if (in_array("Family Planning Method", $treatment_given_array)) {
            $pdf->Write(7, "    Yes       \n");
            $pdf->SetFont("Arial", "", 9);
            $pdf->Write(7, "If FP method given, what method?: ");
            $pdf->Line(60, $line_height + (7 * 8), 110, $line_height + (7 * 8));

            $pdf->Write(7, "   $admissions->Family_Planning_Method                                                 ");
        } else {
            $pdf->Write(7, "   No \n");
        }
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "Partner talked to:");
        $pdf->Line(137, $line_height + (7 * 8), 195, $line_height + (7 * 8));

        $pdf->Write(7, "   $admissions->Partner_Talked_To       \n");
        $pdf->SetFont("Arial", "", 9);
        $paterner_height = 0;
        if ($admissions->Partner_Talked_To == "Yes") {
            $paterner_height = 93;
            $pdf->Write(6, "1. Family Planning ");
            $pdf->Line(38, $line_height + (7 * 8) + (6*1), 150, $line_height + (7 * 8) + (6*1));

            $pdf->Write(6, "$admissions->Family_Planning_Discussed \n");
            $pdf->write(6, "2. Family size  ");
            $pdf->Line(30, $line_height + (7 * 8) + (6*2), 150, $line_height + (7 * 8) + (6*2));

            $pdf->Write(6, "$admissions->Family_Size_Discussed\n");
            $pdf->Write(6, "3. Dual protection/ dual method  ");
            $pdf->Line(55, $line_height + (7 * 8) + (6*3), 150, $line_height + (7 * 8) + (6*3));

            $pdf->Write(6, "$admissions->Dual_Protection_Discussed\n");
            $pdf->Write(6, "4. HIV Testing  ");
            $pdf->Line(30, $line_height + (7 * 8) + (6*4), 150, $line_height + (7 * 8) + (6*4));

            $pdf->Write(6, "$admissions->HIV_Testing_Discussed\n");
            $pdf->Write(6, "5. Infant feeding  ");
            $pdf->Line(35, $line_height + (7 * 8) + (6*5), 150, $line_height + (7 * 8) + (6*5));

            $pdf->Write(6, "$admissions->Infant_Feeding_Discussed\n");
            $pdf->Write(6, "6. Advice to return immediately if: ");
            $pdf->Line(57, $line_height + (7 * 8) + (6*6), 150, $line_height + (7 * 8) + (6*6));

            $pdf->Write(6, "$admissions->Advice_To_Return \n");
            $pdf->SetFont("Arial", "B", 8);
            $pdf->Cell(100, 5, "MOTHER ", 0, 0, "L");
            $pdf->Cell(100, 5, "BABY", 0, 1, "L");
            $pdf->SetFont("Arial", "", 9);
            $pdf->Cell(100, 5, "Heavy bleeding (Much heavier than menstral period) ", 0, 0, "L"); //Mother
            $pdf->Cell(100, 5, "Abnormal breathing", 0, 1, "L"); //baby
            $pdf->Cell(100, 5, "Facial puffiness ", 0, 0, "L"); //Mother
            $pdf->Cell(100, 5, "Failure to beast-feed", 0, 1, "L"); //baby
            $pdf->Cell(100, 5, "Fever ", 0, 0, "L"); //Mother
            $pdf->Cell(100, 5, "Fever", 0, 1, "L"); //baby
            $pdf->Cell(100, 5, "Vomiting ", 0, 0, "L"); //Mother
            $pdf->Cell(100, 5, "Yellow eyes/body", 0, 1, "L"); //baby
            $pdf->Cell(100, 5, "Smelling vaginal discharge/ blood ", 0, 0, "L"); //Mother
            $pdf->Cell(100, 5, "Convulsions", 0, 1, "L"); //baby
            $pdf->Cell(100, 5, "Pain in the legs ", 0, 0, "L"); //Mother
            $pdf->Cell(100, 5, "Discharge in the eyes", 0, 1, "L"); //baby
            $pdf->Cell(100, 5, "Constant abdominal pain ", 0, 0, "L"); //Mother
            $pdf->Cell(100, 5, "Bleeding from the cord", 0, 1, "L"); //baby
            $pdf->Cell(100, 5, "General body weakness ", 0, 0, "L"); //Mother
            $pdf->Cell(100, 5, "Is the cord stump wet, foul smelling or has a discharge?", 0, 1, "L"); //baby
            $pdf->Cell(100, 5, "", 0, 0, "L"); //mother
            $pdf->Cell(100, 5, "Failure to pass urine or stool", 0, 1, "L"); //baby
            $pdf->Cell(100, 5, "", 0, 0, "L"); //Mother
            $pdf->Cell(100, 5, "Injuries", 0, 0, "L"); //baby
        } else {
            $paterner_height = 0;
        }
        $pdf->Write(7, "Management offered:");
        $pdf->Line(40, $line_height + (7 * 9) + $paterner_height, 195, $line_height + (7 * 9) + $paterner_height);

        $pdf->Write(7, "  " . $admissions->Management_Offered . "    \n");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "Special comments on discharge: ");
        $pdf->Line(57, $line_height + (7 * 10) + $paterner_height, 195, $line_height + (7 * 10) + $paterner_height);

        $pdf->Write(7, "  " . $admissions->Clinical_Notes . "    \n");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "Investigations: ");
        $investigations = "";
        $investigations_array = unserialize($admissions->Investigations);
        $inv_names = $investigations_array[0];
        $inv_details = $investigations_array[1];
        for ($i = 0; $i < count($inv_names); $i++) {
            $inv_data = $inv_names[$i] . " (" . $inv_details[$i] . ")";
            $investigations .= ($i != count($inv_names) - 1) ? $inv_data . ", " : $inv_data;
        }
        $pdf->Line(32, $line_height + (7 * 11) + $paterner_height, 195, $line_height + (7 * 11) + $paterner_height);
        $pdf->Line(12, $line_height + (7 * 12) + $paterner_height, 195, $line_height + (7 * 12) + $paterner_height);

        $pdf->Write(7, "  " . $investigations . "\n\n ");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "Procedures:");
        $procedure_taken = "";
        $procedure_taken_array = unserialize($admissions->Procedure_Taken);
        for ($i = 0; $i < count($procedure_taken_array); $i++) {
            $procedure_taken .= ($i != count($procedure_taken_array) - 1) ? $procedure_taken_array[$i] . ", " : $procedure_taken_array[$i];
        }
         $pdf->Line(30, $line_height + (7 * 13) + $paterner_height, 195, $line_height + (7 * 13) + $paterner_height);
        $pdf->Line(12, $line_height + (7 * 14) + $paterner_height, 195, $line_height + (7 * 14) + $paterner_height);

        $pdf->Write(7, "  " . $procedure_taken . " \n\n ");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "Clinical Appointment: ");
         $pdf->Line(42, $line_height + (7 * 15) + $paterner_height, 107, $line_height + (7 * 15) + $paterner_height);
        
        $pdf->Write(7, "  " . $admissions->Clinical_Appointment . "                                                        ");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "Appointment Date:  ");
        $pdf->Line(134, $line_height + (7 * 15) + $paterner_height, 195, $line_height + (7 * 15) + $paterner_height);
        
        $pdf->Write(7, "  " . ($admissions->Appointment_Date != "") ? english_date($admissions->Appointment_Date) . "\n" : " \n");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "Treatment given:  ");
        $treatment_given = "";
        $treatment_given_array = unserialize($admissions->Treatment_Given);
        for ($i = 0; $i < count($treatment_given_array); $i++) {
            $treatment_given .= ($i != count($treatment_given_array) - 1) ? $treatment_given_array[$i] . ", " : $treatment_given_array[$i];
        }
        $pdf->Line(35, $line_height + (7 * 16) + $paterner_height, 195, $line_height + (7 * 16) + $paterner_height);
        $pdf->Line(12, $line_height + (7 * 17) + $paterner_height, 195, $line_height + (7 * 17) + $paterner_height);

        $pdf->Write(7, "   " . $treatment_given . "           ");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, "\n\nDischarged by: ");
        $pdf->Line(30, $line_height + (7 * 18) + $paterner_height,80, $line_height + (7 * 18) + $paterner_height);
        
        $pdf->Write(7, "   " . $discharged_by . "                  ");
        $pdf->SetFont("Arial", "", 9);
        $pdf->Write(7, " Date:");
        $discharged_on = ($admissions->Discharge_Date != "") ? english_date($admissions->Discharged_Date) : "";
      $pdf->Line(90, $line_height + (7 * 18) + $paterner_height,195, $line_height + (7 * 18) + $paterner_height);
       
        $pdf->Write(7, " $discharged_on \n");
         $pdf->Line(25, $line_height + (7 * 19) + $paterner_height,195, $line_height + (7 * 19) + $paterner_height);
       
        $pdf->Write(7, " Signature:");
    }
    $pdf->AutoPrint();
    $pdf->Output();
    // $pdf->output('D', 'Maternity form ' . date("Ymdhis") . '.pdf');
} else
if (isset($_GET['form_type']) && ($_GET['form_type'] == "death_certificate")) {
    $admission_id = $crypt->decode($_GET['admission_id']);
    $admissionsQuery = "SELECT * FROM patient_admission,patient,person WHERE person.Person_Id=patient.Person_Id AND patient.Patient_Id=patient_admission.Patient_Id AND patient_admission.Admission_Id='$admission_id'";
    $admissionsList = DB::getInstance()->querySample($admissionsQuery);
    $pdf->AddPage();
    $pdf->SetTextColor(180, 0, 16);
    $pdf->createHeader("DEATH CERTIFICATE", 185);
    $pdf->SetTextColor(0, 0, 0);
    $pdf->SetFont("Arial", "", 9);
    $pdf->Write(6, "COMING SOON:  ");

    $pdf->AutoPrint();
    $pdf->Output();
    //$pdf->output('D', 'DEATH CERTIFICATE ' . date("Ymdhis") . '.pdf');
} else {
    redirect("We are unable to process your request at this time", "index.php?page=" . $crypt->encode("dashboard"));
}
?>
