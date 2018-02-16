plan puppet_utils::run_task_until(
  String[1] $node,
) {
    # loop using run_task_until custom function
    # loops until the code block is true
    run_task_until('puppet_utils::random', $node, {}) | $results | {
      $r = Integer($results.first().message().chomp())
      notice("run task until: ${r}")
      $r > 20000
  }

  # loop using integer.each 
  # loops until the condition is true or maxtries is reached
  $maxtries = 100
  $maxtries.each | $i | {
    $results = run_task('puppet_utils::random', $node, {})
    $r = Integer($results.first().message().chomp())
    notice("each: ${r}")
    if $r > 20000 {
      break()
    }
  }
}
