extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	#Enlazamos con la vida del soldado
	if get_parent().has_node("soldado"):
		$ProgressBar.value = get_parent().get_node("soldado").health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ProgressBar.value = get_parent().get_node("soldado").health
