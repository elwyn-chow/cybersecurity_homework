$directory = dir

foreach ($item in $directory) {
	Get-Acl  $item.Name
}