Function RunSQL {
    & 'C:\xampp\mysql\bin\mysql.exe' '-uroot'  'test' '-e' "source $PSScriptRoot\query.sql"
}

Function Watch {    
    $file = "$PSScriptRoot\query.sql"
    $this_time = (get-item $file).LastWriteTime
    $last_time = $this_time

    while($true) {
        if ($last_time -ne $this_time) {
            $last_time = $this_time
            RunSQL
        }
        $this_time = (get-item $file).LastWriteTime
    }
}

RunSQL
Watch