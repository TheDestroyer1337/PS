[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
# fenster objekt erstellen
$objForm = New-Object System.Windows.Forms.Form
$objForm.StartPosition = "CenterScreen"
[System.Enum]::GetNames("System.Windows.Forms.FormStartPosition")
#Fenstergrösse definieren
$objForm.Size = New-Object System.Drawing.Size(300,200)
#Fensterüberschrift festlegen
$objForm.Text = "Taschenrechner"

#neues Label objekt erstellen
$objLabel = New-Object System.Windows.Forms.Label
$objLabel.Location = New-Object System.Drawing.Size(10,10) 
$objLabel.Size = New-Object System.Drawing.Size(100,15) 
$objLabel.Text = "Zahl 1"
$objLabel.Name = "Lable1"
$objForm.Controls.Add($objLabel)

#neues TextBox Objekt erstellen
$txtBox1 = New-Object System.Windows.Forms.TextBox
$txtBox1.Location = New-Object System.Drawing.Size(10, 30)
$txtBox1.Size = New-Object System.Drawing.Size(100, 20)
$txtBox1.Name = "txtZahl1"
$objForm.Controls.Add($txtBox1)

$objLabel = New-Object System.Windows.Forms.Label
$objLabel.Location = New-Object System.Drawing.Size(10,70) 
$objLabel.Size = New-Object System.Drawing.Size(100,15) 
$objLabel.Text = "Zahl 2"
$objLabel.Name = "Lable2"
$objForm.Controls.Add($objLabel)

$txtBox2 = New-Object System.Windows.Forms.TextBox
$txtBox2.Location = New-Object System.Drawing.Size(10, 95)
$txtBox2.Size = New-Object System.Drawing.Size(100, 20)
$txtBox2.Name = "txtZahl2"
$objForm.Controls.Add($txtBox2)

$objLabel = New-Object System.Windows.Forms.Label
$objLabel.Location = New-Object System.Drawing.Size(10,125) 
$objLabel.Size = New-Object System.Drawing.Size(100,15) 
$objLabel.Text = "Resultat:"
$objLabel.Name = "Label3"
$objForm.Controls.Add($objLabel)

#aktionen bei einem Knopfdruckes
$adition = {
    $objLabel.Text = [double]$txtBox1.Text + [double]$txtBox2.Text
    $objLabel.Text >> C:\temp\test\res.txt
}

$subtranktion = {
    $objLabel.Text = [double]$txtBox1.Text - [double]$txtBox2.Text
    $objLabel.Text >> C:\temp\test\res.txt
}

$division = {
    $objLabel.Text = [double]$txtBox1.Text / [double]$txtBox2.Text
    $objLabel.Text >> C:\temp\test\res.txt
}

$multiplikation = {
    $objLabel.Text = [double]$txtBox1.Text * [double]$txtBox2.Text
    $objLabel.Text >> C:\temp\test\res.txt
}

#Neues Buttonobjekt erstellen
$AdButton = New-Object System.Windows.Forms.Button
$AdButton.Location = New-Object System.Drawing.Size(120,10)
$AdButton.Size = New-Object System.Drawing.Size(30,23)
$AdButton.Text = "+"
$AdButton.Add_Click($adition)
$objForm.Controls.Add($AdButton)

$SubButton = New-Object System.Windows.Forms.Button
$SubButton.Location = New-Object System.Drawing.Size(120,35)
$SubButton.Size = New-Object System.Drawing.Size(30,23)
$SubButton.Text = "-"
$SubButton.Add_Click($subtranktion)
$objForm.Controls.Add($SubButton)

$DivButton = New-Object System.Windows.Forms.Button
$DivButton.Location = New-Object System.Drawing.Size(120,60)
$DivButton.Size = New-Object System.Drawing.Size(30,23)
$DivButton.Text = "/"
$DivButton.Add_Click($division)
$objForm.Controls.Add($DivButton)

$MulButton = New-Object System.Windows.Forms.Button
$MulButton.Location = New-Object System.Drawing.Size(120,85)
$MulButton.Size = New-Object System.Drawing.Size(30,23)
$MulButton.Text = "*"
$MulButton.Add_Click($multiplikation)
$objForm.Controls.Add($MulButton)


$CancButton = New-Object System.Windows.Forms.Button
$CancButton.Location = New-Object System.Drawing.Size(170,50)
$CancButton.Size = New-Object System.Drawing.Size(75,23)
$CancButton.Text = "Schliessen"
$CancButton.Add_Click({$objForm.Close()})
$objForm.Controls.Add($CancButton)

#WindowsForm anzeigen
$objForm.ShowDialog()