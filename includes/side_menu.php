<?php
$_SESSION["PREVIOUS_URL"] = $_SERVER["REQUEST_URI"];
?>
<div class="sidebar-container">
    <div class="sidemenu-container navbar-collapse collapse fixed-menu">
        <div id="remove-scroll">
            <ul class="sidemenu  page-header-fixed" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 20px">
                <li class="sidebar-toggler-wrapper hide">
                    <div class="sidebar-toggler">
                        <span></span>
                    </div>
                </li>
                <li class="sidebar-user-panel">
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="staff_image/<?php echo $_SESSION['hospital_profile_picture'] ?>" class="img-circle user-img-circle" alt="" />
                        </div>
                        <div class="pull-left info">
                            <h5>
                                <a href=""><?php echo $_SESSION['hospital_staff_names']; ?></a>
                                <span class="profile-status online"></span>
                            </h5>
                            <p class="profile-title"><?php echo $_SESSION['hospital_role']; ?></p>
                        </div>
                    </div>
                </li>
                <li class="nav-item start active open">
                    <a href="index.php?page=<?php echo $crypt->encode("dashboard"); ?>">
                        <i class="fa fa-dashboard"></i>
                        <span class="title">Dashboard</span>
                    </a>
                </li>

                <li class="nav-item hidden"> 
                    <a href="javascript:;" class="nav-link nav-toggle"><i class="fa fa-gear"></i>
                        <span class="title">Settings</span><span class="arrow "></span>
                    </a>
                </li>
                 <?php  if ((isset($_SESSION['hospital_role']) && ($_SESSION['hospital_role'] == "Human Resource" || $_SESSION['hospital_role'] == "Staff")) && !isset($_SESSION['immergencepassword'])) {
                    
                } else {?>
                <li class="nav-item"> 
                    <a href="javascript:;" class="nav-link nav-toggle"><i class="fa fa-users"></i>
                        <span class="title">User Info</span><span class="arrow "></span>
                    </a>
                    <ul class="sub-menu" >
                        <li class="nav-item">
                            <a href="index.php?page=<?php echo $crypt->encode("add_staff"); ?>&mode=register" >Register Member</a>
                        </li>
                        <li class="nav-item">
                            <a href="index.php?page=<?php echo $crypt->encode("add_staff"); ?>&mode=registered" >All Members</a>

                        </li>


                    </ul>
                </li> 
                <?php}
                if ((isset($_SESSION['hospital_role']) && ($_SESSION['hospital_role'] == "Human Resource" || $_SESSION['hospital_role'] == "Staff")) && !isset($_SESSION['immergencepassword'])) {
                    
                } else {
                    ?>
                    <li class="nav-item"> 
                        <a href="javascript:;" class="nav-link nav-toggle"><i class="fa fa-user"></i>
                            <span class="title">Login Privillages</span><span class="arrow "></span>
                        </a>
                        <ul class="sub-menu" >
                            <li class="nav-item">
                                <a href="index.php?page=<?php echo $crypt->encode("add_user"); ?>" >Add account</a>
                            </li>
                            <li class="nav-item">
                                <a href="index.php?page=<?php echo $crypt->encode("view_users"); ?>" >All User Accounts</a>
                            </li>
                        </ul>
                    </li><?php
                }?>
                    <li class="nav-item"> 
                        <a href="javascript:;" class="nav-link nav-toggle"><i class="fa fa-user"></i>
                            <span class="title">Clients</span><span class="arrow "></span>
                        </a>
                        <ul class="sub-menu" >
                            <li class="nav-item">
                                <a href="index.php?page=<?php echo $crypt->encode("register_patient"); ?>" >Register Client</a>
                            </li>
                            <li class="nav-item">
                                <a href="index.php?page=<?php echo $crypt->encode("all_patients"); ?>" >ANC Register</a>
                            </li>


                        </ul>
                    </li>


                <li class="nav-item">
                    <a href="index.php?page=<?php echo $crypt->encode("logout"); ?>">
                        <i class="fa fa-power-off"></i>
                        <span class="title">Logout</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>