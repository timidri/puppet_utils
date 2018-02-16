# run_task_until - call task in a loop until code block is true

Puppet::Functions.create_function(:run_task_until) do
  local_types do
    type 'TargetOrTargets = Variant[String[1], Target, Array[TargetOrTargets]]'
  end

  dispatch :run_task_until do
    param 'String[1]', :task_name
    param 'TargetOrTargets', :targets
    optional_param 'Hash[String[1], Any]', :task_args
    block_param
    return_type 'ResultSet'
  end

  def run_task_until(task_name, targets, task_args)
    # calls the task at least once
    results = call_function('run_task', task_name, targets, task_args)
    until yield(results)
      # puts results.first.value['_output']
      results = call_function('run_task', task_name, targets, task_args)
    end
    results
  end
end
