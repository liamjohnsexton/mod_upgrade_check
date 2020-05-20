plan mod_upgrade_check::grab_module_info (
  TargetSpec $nodes,
) {
  # get results from each task
  $results = run_task('mod_upgrade_check::get_code_environments', $nodes)
  $code_environments_unsplit = $results[0] #extract result from resultset
  $code_environments_array = split($code_environments_unsplit.message, '\n') #in the result, extract string from _output field (hence .message), then create new array where each element is the item before \n

  $workstation_directory = run_task('mod_upgrade_check::get_current_directory', 'localhost')
  $workstation_directory_unsplit = $workstation_directory[0]
  $workstation_directory_split = split($workstation_directory_unsplit.message, '\n')

  $code_environments_array.each |String $current_code_environment| {

    $target_directory = "${workstation_directory_split[0]}/${current_code_environment}_environment_information/module_per_${current_code_environment}.csv"
    $modules = run_task('mod_upgrade_check::get_modules_per_environment', $nodes, code_environment => $current_code_environment)
    $modules_split = $modules[0]
    run_task('mod_upgrade_check::mkdir_p_file','localhost', path => $target_directory, content => $modules_split.message)
    
    $module_complexities = run_task('mod_upgrade_check::get_module_complexity', $nodes, code_environment => $current_code_environment)
    $mod_complexity_split = $module_complexities[0]
    file::write("${workstation_directory_split[0]}/${current_code_environment}_environment_information/module_comeplxity_for_${current_code_environment}.csv", $mod_complexity_split.message)

    $roles_and_profiles = run_task('mod_upgrade_check::get_roles_and_profiles', $nodes, code_environment => $current_code_environment)
    $roles_and_profiles_split = $roles_and_profiles[0]
    file::write("${workstation_directory_split[0]}/${current_code_environment}_environment_information/roles_and_profiles_for_${current_code_environment}.csv", $roles_and_profiles_split.message)
  }
}

