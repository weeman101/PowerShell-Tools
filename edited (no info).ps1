[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null

#############
# Variables #
#############

$form1 = New-Object System.Windows.Forms.Form
$combobox1 = New-Object System.Windows.Forms.ComboBox
$combobox1= New-Object System.Windows.Forms.ComboBox
$combobox2 = New-Object System.Windows.Forms.ComboBox
$label1 = New-Object System.Windows.Forms.Label
$label2 = New-Object System.Windows.Forms.Label
$button1 = New-Object System.Windows.Forms.Button


##################################################################
#            SWITCH INFORMATION - SWitch Combo Box               #
##################################################################
$FormEvent_Load = {
##################################################################################################################### Basement
$combobox1.DisplayMember = 'Name'
    $combobox1.Items.Add(
        [PSCustomObject]@{
            'Name' = '******BASEMENT******'
            })
    $combobox1.DisplayMember = 'Name'
    $combobox1.Items.Add(
        [PSCustomObject]@{
            'Name' = 'GA- GC105C'
            'Address' = [ipaddress]::Parse('10.1.1.1')
        })
}

##################################################################
#         NEMA INFORMATION - NEMA COMBOBOX                       #
##################################################################

$FormEvent_Load2 = {
$combobox2.DisplayMember = 'Name'
    $combobox2.Items.Add(
        [PSCustomObject]@{
            'Name' = 'Aaron'
            'UserName' = ('domain\username')
        })

        }

###########################################################
#                        FORM LAYOUT                      #
###########################################################
$CBEvent_SelectedIndexChanged = {
    $label1.Text = $combobox1.SelectedItem.Address.ToString()
    }
  
$CBEvent_SelectedIndexChanged2 = {
    $label2.Text = $combobox2.SelectedItem.Username.ToString()
    }

$InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState

$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 292
$System_Drawing_Size.Height = 266
$form1.ClientSize = $System_Drawing_Size

###################
# Label1 Location #
###################

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 125
$System_Drawing_Point.Y = 5

###################
# Label2 Location #
###################

$System_Drawing_Point3 = New-Object System.Drawing.Point
$System_Drawing_Point3.X = 150
$System_Drawing_Point3.Y = 85

###################
# Button Location #
###################

$System_Drawing_Point1 = New-Object System.Drawing.Point
$System_Drawing_Point1.X = 157
$System_Drawing_Point1.Y = 140

#######################
# combo box2 Location #
#######################

$System_Drawing_Point2 = New-Object System.Drawing.Point
$System_Drawing_Point2.X = 150
$System_Drawing_Point2.Y = 110


#############
# Control's #
#############

$form1.Controls.Add($combobox1)
$form1.Controls.Add($combobox2)
$form1.Controls.Add($label1)
$form1.Controls.Add($label2)
$form1.Controls.Add($button1)
$combobox2.Location = $System_Drawing_Point2
$label1.Location = $System_Drawing_Point
$label1.Text = 'Select Switch:'
$label2.Location = $System_Drawing_Point3
$label2.Text = 'Select NEMA Account:'
$button1.Location = $System_Drawing_Point1
$button1.Text = 'Connect'
$button1.Add_Click({cmd /c start powershell -Command ssh -l $($label2.Text)@$($label1.Text)})
$form1.add_Load($FormEvent_Load)
$form1.add_Load($FormEvent_Load2)
$ComboBox1.add_SelectedIndexChanged($CBEvent_SelectedIndexChanged)
$ComboBox2.add_SelectedIndexChanged($CBEvent_SelectedIndexChanged2)
$form1.ShowDialog()| Out-Null