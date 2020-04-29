<link href="js/select2/css/select2.css" rel="stylesheet" type="text/css" />
<link href="js/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
<?php
if (isset($_POST["class_name_model"]) && !empty($_POST["class_name_model"])) {
    $subcounty_id = $_POST["class_name_model"];
    $query = "select * from parishes WHERE SubcountyId='$subcounty_id'";
    if (DB::getInstance()->checkRows($query)) {
        ?>
        <div class="form-group">
            <label>Parish:</label>
            <select name="parish_id" class="select2"  onchange="getvillage(this.value);" required>
                <option value="">select</option>
                <?php
                $parish_query = DB::getInstance()->query($query);
                foreach ($parish_query->results() as $parish) {
                    echo '<option value="' . $parish->ParishId . '">' . $parish->ParishName . '</option>';
                }
                ?>
            </select>
        </div>
        <?php
    } else {
        echo'<h5 style="color:red">Please select subcounty first</h5>';
    }
}
if (isset($_POST["parish_name"]) && !empty($_POST["parish_name"])) {
    $parish_id = $_POST["parish_name"];
    $query = "select * from village WHERE ParishId='$parish_id'";
    if (DB::getInstance()->checkRows($query)) {
        ?>
        <div class="form-group">
            <label>Village:</label>
            <select name="village_id" class="select2" required >
                <option value="">select</option>
                <?php
                $village_query = DB::getInstance()->query($query);
                foreach ($village_query->results() as $village) {
                    echo '<option value="' . $village->VillageId . '">' . $village->VillageName . '</option>';
                }
                ?>
            </select>
        </div>
        <?php
    } else {
        echo'<h5 style="color:red">No village registered for this parish</h5>';
    }
}
?>


<script src="js/select2/js/select2.js" type="text/javascript"></script>
<script src="js/select2/js/select2-init.js" type="text/javascript"></script>

