??
??
8
Const
output"dtype"
valuetensor"
dtypetype

NoOp
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetype?
?
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ?
q
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape?"serve*2.2.02v2.2.0-rc4-8-g2b96f3662b8??
?
text_cnn/embedding/embeddingsVarHandleOp*
_output_shapes
: *
dtype0*
shape:
?>?*.
shared_nametext_cnn/embedding/embeddings
?
1text_cnn/embedding/embeddings/Read/ReadVariableOpReadVariableOptext_cnn/embedding/embeddings* 
_output_shapes
:
?>?*
dtype0
?
text_cnn/dense/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	?*&
shared_nametext_cnn/dense/kernel
?
)text_cnn/dense/kernel/Read/ReadVariableOpReadVariableOptext_cnn/dense/kernel*
_output_shapes
:	?*
dtype0
~
text_cnn/dense/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_nametext_cnn/dense/bias
w
'text_cnn/dense/bias/Read/ReadVariableOpReadVariableOptext_cnn/dense/bias*
_output_shapes
:*
dtype0
f
	Adam/iterVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	Adam/iter
_
Adam/iter/Read/ReadVariableOpReadVariableOp	Adam/iter*
_output_shapes
: *
dtype0	
j
Adam/beta_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_1
c
Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_output_shapes
: *
dtype0
j
Adam/beta_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_2
c
Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
_output_shapes
: *
dtype0
h

Adam/decayVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name
Adam/decay
a
Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_output_shapes
: *
dtype0
x
Adam/learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/learning_rate
q
&Adam/learning_rate/Read/ReadVariableOpReadVariableOpAdam/learning_rate*
_output_shapes
: *
dtype0
?
text_cnn/conv1d/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:??*'
shared_nametext_cnn/conv1d/kernel
?
*text_cnn/conv1d/kernel/Read/ReadVariableOpReadVariableOptext_cnn/conv1d/kernel*$
_output_shapes
:??*
dtype0
?
text_cnn/conv1d/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*%
shared_nametext_cnn/conv1d/bias
z
(text_cnn/conv1d/bias/Read/ReadVariableOpReadVariableOptext_cnn/conv1d/bias*
_output_shapes	
:?*
dtype0
?
text_cnn/conv1d_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:??*)
shared_nametext_cnn/conv1d_1/kernel
?
,text_cnn/conv1d_1/kernel/Read/ReadVariableOpReadVariableOptext_cnn/conv1d_1/kernel*$
_output_shapes
:??*
dtype0
?
text_cnn/conv1d_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*'
shared_nametext_cnn/conv1d_1/bias
~
*text_cnn/conv1d_1/bias/Read/ReadVariableOpReadVariableOptext_cnn/conv1d_1/bias*
_output_shapes	
:?*
dtype0
?
text_cnn/conv1d_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:??*)
shared_nametext_cnn/conv1d_2/kernel
?
,text_cnn/conv1d_2/kernel/Read/ReadVariableOpReadVariableOptext_cnn/conv1d_2/kernel*$
_output_shapes
:??*
dtype0
?
text_cnn/conv1d_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*'
shared_nametext_cnn/conv1d_2/bias
~
*text_cnn/conv1d_2/bias/Read/ReadVariableOpReadVariableOptext_cnn/conv1d_2/bias*
_output_shapes	
:?*
dtype0
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
b
total_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	total_1
[
total_1/Read/ReadVariableOpReadVariableOptotal_1*
_output_shapes
: *
dtype0
b
count_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	count_1
[
count_1/Read/ReadVariableOpReadVariableOpcount_1*
_output_shapes
: *
dtype0
?
$Adam/text_cnn/embedding/embeddings/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:
?>?*5
shared_name&$Adam/text_cnn/embedding/embeddings/m
?
8Adam/text_cnn/embedding/embeddings/m/Read/ReadVariableOpReadVariableOp$Adam/text_cnn/embedding/embeddings/m* 
_output_shapes
:
?>?*
dtype0
?
Adam/text_cnn/dense/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	?*-
shared_nameAdam/text_cnn/dense/kernel/m
?
0Adam/text_cnn/dense/kernel/m/Read/ReadVariableOpReadVariableOpAdam/text_cnn/dense/kernel/m*
_output_shapes
:	?*
dtype0
?
Adam/text_cnn/dense/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*+
shared_nameAdam/text_cnn/dense/bias/m
?
.Adam/text_cnn/dense/bias/m/Read/ReadVariableOpReadVariableOpAdam/text_cnn/dense/bias/m*
_output_shapes
:*
dtype0
?
Adam/text_cnn/conv1d/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:??*.
shared_nameAdam/text_cnn/conv1d/kernel/m
?
1Adam/text_cnn/conv1d/kernel/m/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d/kernel/m*$
_output_shapes
:??*
dtype0
?
Adam/text_cnn/conv1d/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*,
shared_nameAdam/text_cnn/conv1d/bias/m
?
/Adam/text_cnn/conv1d/bias/m/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d/bias/m*
_output_shapes	
:?*
dtype0
?
Adam/text_cnn/conv1d_1/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:??*0
shared_name!Adam/text_cnn/conv1d_1/kernel/m
?
3Adam/text_cnn/conv1d_1/kernel/m/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d_1/kernel/m*$
_output_shapes
:??*
dtype0
?
Adam/text_cnn/conv1d_1/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*.
shared_nameAdam/text_cnn/conv1d_1/bias/m
?
1Adam/text_cnn/conv1d_1/bias/m/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d_1/bias/m*
_output_shapes	
:?*
dtype0
?
Adam/text_cnn/conv1d_2/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:??*0
shared_name!Adam/text_cnn/conv1d_2/kernel/m
?
3Adam/text_cnn/conv1d_2/kernel/m/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d_2/kernel/m*$
_output_shapes
:??*
dtype0
?
Adam/text_cnn/conv1d_2/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*.
shared_nameAdam/text_cnn/conv1d_2/bias/m
?
1Adam/text_cnn/conv1d_2/bias/m/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d_2/bias/m*
_output_shapes	
:?*
dtype0
?
$Adam/text_cnn/embedding/embeddings/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:
?>?*5
shared_name&$Adam/text_cnn/embedding/embeddings/v
?
8Adam/text_cnn/embedding/embeddings/v/Read/ReadVariableOpReadVariableOp$Adam/text_cnn/embedding/embeddings/v* 
_output_shapes
:
?>?*
dtype0
?
Adam/text_cnn/dense/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	?*-
shared_nameAdam/text_cnn/dense/kernel/v
?
0Adam/text_cnn/dense/kernel/v/Read/ReadVariableOpReadVariableOpAdam/text_cnn/dense/kernel/v*
_output_shapes
:	?*
dtype0
?
Adam/text_cnn/dense/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*+
shared_nameAdam/text_cnn/dense/bias/v
?
.Adam/text_cnn/dense/bias/v/Read/ReadVariableOpReadVariableOpAdam/text_cnn/dense/bias/v*
_output_shapes
:*
dtype0
?
Adam/text_cnn/conv1d/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:??*.
shared_nameAdam/text_cnn/conv1d/kernel/v
?
1Adam/text_cnn/conv1d/kernel/v/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d/kernel/v*$
_output_shapes
:??*
dtype0
?
Adam/text_cnn/conv1d/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*,
shared_nameAdam/text_cnn/conv1d/bias/v
?
/Adam/text_cnn/conv1d/bias/v/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d/bias/v*
_output_shapes	
:?*
dtype0
?
Adam/text_cnn/conv1d_1/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:??*0
shared_name!Adam/text_cnn/conv1d_1/kernel/v
?
3Adam/text_cnn/conv1d_1/kernel/v/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d_1/kernel/v*$
_output_shapes
:??*
dtype0
?
Adam/text_cnn/conv1d_1/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*.
shared_nameAdam/text_cnn/conv1d_1/bias/v
?
1Adam/text_cnn/conv1d_1/bias/v/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d_1/bias/v*
_output_shapes	
:?*
dtype0
?
Adam/text_cnn/conv1d_2/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:??*0
shared_name!Adam/text_cnn/conv1d_2/kernel/v
?
3Adam/text_cnn/conv1d_2/kernel/v/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d_2/kernel/v*$
_output_shapes
:??*
dtype0
?
Adam/text_cnn/conv1d_2/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*.
shared_nameAdam/text_cnn/conv1d_2/bias/v
?
1Adam/text_cnn/conv1d_2/bias/v/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d_2/bias/v*
_output_shapes	
:?*
dtype0

NoOpNoOp
?8
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*?8
value?8B?8 B?8
?
kernel_sizes
	embedding
	convs
max_poolings

classifier
	optimizer
	variables
regularization_losses
	trainable_variables

	keras_api

signatures
 
b

embeddings
	variables
regularization_losses
trainable_variables
	keras_api

0
1
2

0
1
2
h

kernel
bias
	variables
regularization_losses
trainable_variables
	keras_api
?
iter

beta_1

beta_2
	 decay
!learning_ratemxmymz"m{#m|$m}%m~&m'm?v?v?v?"v?#v?$v?%v?&v?'v?
?
0
"1
#2
$3
%4
&5
'6
7
8
 
?
0
"1
#2
$3
%4
&5
'6
7
8
?
	variables
(non_trainable_variables
)layer_metrics
regularization_losses
*layer_regularization_losses
	trainable_variables
+metrics

,layers
 
b`
VARIABLE_VALUEtext_cnn/embedding/embeddings/embedding/embeddings/.ATTRIBUTES/VARIABLE_VALUE

0
 

0
?
	variables
-non_trainable_variables
.layer_metrics
regularization_losses
/layer_regularization_losses
trainable_variables
0metrics

1layers
h

"kernel
#bias
2	variables
3regularization_losses
4trainable_variables
5	keras_api
h

$kernel
%bias
6	variables
7regularization_losses
8trainable_variables
9	keras_api
h

&kernel
'bias
:	variables
;regularization_losses
<trainable_variables
=	keras_api
R
>	variables
?regularization_losses
@trainable_variables
A	keras_api
R
B	variables
Cregularization_losses
Dtrainable_variables
E	keras_api
R
F	variables
Gregularization_losses
Htrainable_variables
I	keras_api
WU
VARIABLE_VALUEtext_cnn/dense/kernel,classifier/kernel/.ATTRIBUTES/VARIABLE_VALUE
SQ
VARIABLE_VALUEtext_cnn/dense/bias*classifier/bias/.ATTRIBUTES/VARIABLE_VALUE

0
1
 

0
1
?
	variables
Jnon_trainable_variables
Klayer_metrics
regularization_losses
Llayer_regularization_losses
trainable_variables
Mmetrics

Nlayers
HF
VARIABLE_VALUE	Adam/iter)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_1+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_2+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUE
JH
VARIABLE_VALUE
Adam/decay*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUE
ZX
VARIABLE_VALUEAdam/learning_rate2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUE
RP
VARIABLE_VALUEtext_cnn/conv1d/kernel&variables/1/.ATTRIBUTES/VARIABLE_VALUE
PN
VARIABLE_VALUEtext_cnn/conv1d/bias&variables/2/.ATTRIBUTES/VARIABLE_VALUE
TR
VARIABLE_VALUEtext_cnn/conv1d_1/kernel&variables/3/.ATTRIBUTES/VARIABLE_VALUE
RP
VARIABLE_VALUEtext_cnn/conv1d_1/bias&variables/4/.ATTRIBUTES/VARIABLE_VALUE
TR
VARIABLE_VALUEtext_cnn/conv1d_2/kernel&variables/5/.ATTRIBUTES/VARIABLE_VALUE
RP
VARIABLE_VALUEtext_cnn/conv1d_2/bias&variables/6/.ATTRIBUTES/VARIABLE_VALUE
 
 
 

O0
P1
8
0
1
2
3
4
5
6
7
 
 
 
 
 

"0
#1
 

"0
#1
?
2	variables
Qnon_trainable_variables
Rlayer_metrics
3regularization_losses
Slayer_regularization_losses
4trainable_variables
Tmetrics

Ulayers

$0
%1
 

$0
%1
?
6	variables
Vnon_trainable_variables
Wlayer_metrics
7regularization_losses
Xlayer_regularization_losses
8trainable_variables
Ymetrics

Zlayers

&0
'1
 

&0
'1
?
:	variables
[non_trainable_variables
\layer_metrics
;regularization_losses
]layer_regularization_losses
<trainable_variables
^metrics

_layers
 
 
 
?
>	variables
`non_trainable_variables
alayer_metrics
?regularization_losses
blayer_regularization_losses
@trainable_variables
cmetrics

dlayers
 
 
 
?
B	variables
enon_trainable_variables
flayer_metrics
Cregularization_losses
glayer_regularization_losses
Dtrainable_variables
hmetrics

ilayers
 
 
 
?
F	variables
jnon_trainable_variables
klayer_metrics
Gregularization_losses
llayer_regularization_losses
Htrainable_variables
mmetrics

nlayers
 
 
 
 
 
4
	ototal
	pcount
q	variables
r	keras_api
D
	stotal
	tcount
u
_fn_kwargs
v	variables
w	keras_api
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
OM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE
OM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE

o0
p1

q	variables
QO
VARIABLE_VALUEtotal_14keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUE
QO
VARIABLE_VALUEcount_14keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUE
 

s0
t1

v	variables
??
VARIABLE_VALUE$Adam/text_cnn/embedding/embeddings/mKembedding/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/text_cnn/dense/kernel/mHclassifier/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
vt
VARIABLE_VALUEAdam/text_cnn/dense/bias/mFclassifier/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
us
VARIABLE_VALUEAdam/text_cnn/conv1d/kernel/mBvariables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
sq
VARIABLE_VALUEAdam/text_cnn/conv1d/bias/mBvariables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
wu
VARIABLE_VALUEAdam/text_cnn/conv1d_1/kernel/mBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
us
VARIABLE_VALUEAdam/text_cnn/conv1d_1/bias/mBvariables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
wu
VARIABLE_VALUEAdam/text_cnn/conv1d_2/kernel/mBvariables/5/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
us
VARIABLE_VALUEAdam/text_cnn/conv1d_2/bias/mBvariables/6/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
??
VARIABLE_VALUE$Adam/text_cnn/embedding/embeddings/vKembedding/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/text_cnn/dense/kernel/vHclassifier/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
vt
VARIABLE_VALUEAdam/text_cnn/dense/bias/vFclassifier/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
us
VARIABLE_VALUEAdam/text_cnn/conv1d/kernel/vBvariables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
sq
VARIABLE_VALUEAdam/text_cnn/conv1d/bias/vBvariables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
wu
VARIABLE_VALUEAdam/text_cnn/conv1d_1/kernel/vBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
us
VARIABLE_VALUEAdam/text_cnn/conv1d_1/bias/vBvariables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
wu
VARIABLE_VALUEAdam/text_cnn/conv1d_2/kernel/vBvariables/5/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
us
VARIABLE_VALUEAdam/text_cnn/conv1d_2/bias/vBvariables/6/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
|
serving_default_input_1Placeholder*(
_output_shapes
:??????????'*
dtype0*
shape:??????????'
?
StatefulPartitionedCallStatefulPartitionedCallserving_default_input_1text_cnn/embedding/embeddingstext_cnn/conv1d/kerneltext_cnn/conv1d/biastext_cnn/conv1d_1/kerneltext_cnn/conv1d_1/biastext_cnn/conv1d_2/kerneltext_cnn/conv1d_2/biastext_cnn/dense/kerneltext_cnn/dense/bias*
Tin
2
*
Tout
2*'
_output_shapes
:?????????*+
_read_only_resource_inputs
		**
config_proto

CPU

GPU 2J 8*+
f&R$
"__inference_signature_wrapper_6050
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
?
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename1text_cnn/embedding/embeddings/Read/ReadVariableOp)text_cnn/dense/kernel/Read/ReadVariableOp'text_cnn/dense/bias/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOp*text_cnn/conv1d/kernel/Read/ReadVariableOp(text_cnn/conv1d/bias/Read/ReadVariableOp,text_cnn/conv1d_1/kernel/Read/ReadVariableOp*text_cnn/conv1d_1/bias/Read/ReadVariableOp,text_cnn/conv1d_2/kernel/Read/ReadVariableOp*text_cnn/conv1d_2/bias/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOptotal_1/Read/ReadVariableOpcount_1/Read/ReadVariableOp8Adam/text_cnn/embedding/embeddings/m/Read/ReadVariableOp0Adam/text_cnn/dense/kernel/m/Read/ReadVariableOp.Adam/text_cnn/dense/bias/m/Read/ReadVariableOp1Adam/text_cnn/conv1d/kernel/m/Read/ReadVariableOp/Adam/text_cnn/conv1d/bias/m/Read/ReadVariableOp3Adam/text_cnn/conv1d_1/kernel/m/Read/ReadVariableOp1Adam/text_cnn/conv1d_1/bias/m/Read/ReadVariableOp3Adam/text_cnn/conv1d_2/kernel/m/Read/ReadVariableOp1Adam/text_cnn/conv1d_2/bias/m/Read/ReadVariableOp8Adam/text_cnn/embedding/embeddings/v/Read/ReadVariableOp0Adam/text_cnn/dense/kernel/v/Read/ReadVariableOp.Adam/text_cnn/dense/bias/v/Read/ReadVariableOp1Adam/text_cnn/conv1d/kernel/v/Read/ReadVariableOp/Adam/text_cnn/conv1d/bias/v/Read/ReadVariableOp3Adam/text_cnn/conv1d_1/kernel/v/Read/ReadVariableOp1Adam/text_cnn/conv1d_1/bias/v/Read/ReadVariableOp3Adam/text_cnn/conv1d_2/kernel/v/Read/ReadVariableOp1Adam/text_cnn/conv1d_2/bias/v/Read/ReadVariableOpConst*1
Tin*
(2&	*
Tout
2*
_output_shapes
: * 
_read_only_resource_inputs
 **
config_proto

CPU

GPU 2J 8*&
f!R
__inference__traced_save_6221
?	
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenametext_cnn/embedding/embeddingstext_cnn/dense/kerneltext_cnn/dense/bias	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetext_cnn/conv1d/kerneltext_cnn/conv1d/biastext_cnn/conv1d_1/kerneltext_cnn/conv1d_1/biastext_cnn/conv1d_2/kerneltext_cnn/conv1d_2/biastotalcounttotal_1count_1$Adam/text_cnn/embedding/embeddings/mAdam/text_cnn/dense/kernel/mAdam/text_cnn/dense/bias/mAdam/text_cnn/conv1d/kernel/mAdam/text_cnn/conv1d/bias/mAdam/text_cnn/conv1d_1/kernel/mAdam/text_cnn/conv1d_1/bias/mAdam/text_cnn/conv1d_2/kernel/mAdam/text_cnn/conv1d_2/bias/m$Adam/text_cnn/embedding/embeddings/vAdam/text_cnn/dense/kernel/vAdam/text_cnn/dense/bias/vAdam/text_cnn/conv1d/kernel/vAdam/text_cnn/conv1d/bias/vAdam/text_cnn/conv1d_1/kernel/vAdam/text_cnn/conv1d_1/bias/vAdam/text_cnn/conv1d_2/kernel/vAdam/text_cnn/conv1d_2/bias/v*0
Tin)
'2%*
Tout
2*
_output_shapes
: * 
_read_only_resource_inputs
 **
config_proto

CPU

GPU 2J 8*)
f$R"
 __inference__traced_restore_6341??
?U
?
__inference__wrapped_model_5791
input_1?
;text_cnn_embedding_embedding_lookup_readvariableop_resource?
;text_cnn_conv1d_conv1d_expanddims_1_readvariableop_resource3
/text_cnn_conv1d_biasadd_readvariableop_resourceA
=text_cnn_conv1d_1_conv1d_expanddims_1_readvariableop_resource5
1text_cnn_conv1d_1_biasadd_readvariableop_resourceA
=text_cnn_conv1d_2_conv1d_expanddims_1_readvariableop_resource5
1text_cnn_conv1d_2_biasadd_readvariableop_resource1
-text_cnn_dense_matmul_readvariableop_resource2
.text_cnn_dense_biasadd_readvariableop_resource
identity??
2text_cnn/embedding/embedding_lookup/ReadVariableOpReadVariableOp;text_cnn_embedding_embedding_lookup_readvariableop_resource* 
_output_shapes
:
?>?*
dtype024
2text_cnn/embedding/embedding_lookup/ReadVariableOp?
(text_cnn/embedding/embedding_lookup/axisConst*E
_class;
97loc:@text_cnn/embedding/embedding_lookup/ReadVariableOp*
_output_shapes
: *
dtype0*
value	B : 2*
(text_cnn/embedding/embedding_lookup/axis?
#text_cnn/embedding/embedding_lookupGatherV2:text_cnn/embedding/embedding_lookup/ReadVariableOp:value:0input_11text_cnn/embedding/embedding_lookup/axis:output:0*
Taxis0*
Tindices0*
Tparams0*E
_class;
97loc:@text_cnn/embedding/embedding_lookup/ReadVariableOp*-
_output_shapes
:??????????'?2%
#text_cnn/embedding/embedding_lookup?
,text_cnn/embedding/embedding_lookup/IdentityIdentity,text_cnn/embedding/embedding_lookup:output:0*
T0*-
_output_shapes
:??????????'?2.
,text_cnn/embedding/embedding_lookup/Identity?
%text_cnn/conv1d/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2'
%text_cnn/conv1d/conv1d/ExpandDims/dim?
!text_cnn/conv1d/conv1d/ExpandDims
ExpandDims5text_cnn/embedding/embedding_lookup/Identity:output:0.text_cnn/conv1d/conv1d/ExpandDims/dim:output:0*
T0*1
_output_shapes
:??????????'?2#
!text_cnn/conv1d/conv1d/ExpandDims?
2text_cnn/conv1d/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp;text_cnn_conv1d_conv1d_expanddims_1_readvariableop_resource*$
_output_shapes
:??*
dtype024
2text_cnn/conv1d/conv1d/ExpandDims_1/ReadVariableOp?
'text_cnn/conv1d/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2)
'text_cnn/conv1d/conv1d/ExpandDims_1/dim?
#text_cnn/conv1d/conv1d/ExpandDims_1
ExpandDims:text_cnn/conv1d/conv1d/ExpandDims_1/ReadVariableOp:value:00text_cnn/conv1d/conv1d/ExpandDims_1/dim:output:0*
T0*(
_output_shapes
:??2%
#text_cnn/conv1d/conv1d/ExpandDims_1?
text_cnn/conv1d/conv1dConv2D*text_cnn/conv1d/conv1d/ExpandDims:output:0,text_cnn/conv1d/conv1d/ExpandDims_1:output:0*
T0*1
_output_shapes
:??????????'?*
paddingVALID*
strides
2
text_cnn/conv1d/conv1d?
text_cnn/conv1d/conv1d/SqueezeSqueezetext_cnn/conv1d/conv1d:output:0*
T0*-
_output_shapes
:??????????'?*
squeeze_dims
2 
text_cnn/conv1d/conv1d/Squeeze?
&text_cnn/conv1d/BiasAdd/ReadVariableOpReadVariableOp/text_cnn_conv1d_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02(
&text_cnn/conv1d/BiasAdd/ReadVariableOp?
text_cnn/conv1d/BiasAddBiasAdd'text_cnn/conv1d/conv1d/Squeeze:output:0.text_cnn/conv1d/BiasAdd/ReadVariableOp:value:0*
T0*-
_output_shapes
:??????????'?2
text_cnn/conv1d/BiasAdd?
text_cnn/conv1d/ReluRelu text_cnn/conv1d/BiasAdd:output:0*
T0*-
_output_shapes
:??????????'?2
text_cnn/conv1d/Relu?
3text_cnn/global_max_pooling1d/Max/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :25
3text_cnn/global_max_pooling1d/Max/reduction_indices?
!text_cnn/global_max_pooling1d/MaxMax"text_cnn/conv1d/Relu:activations:0<text_cnn/global_max_pooling1d/Max/reduction_indices:output:0*
T0*(
_output_shapes
:??????????2#
!text_cnn/global_max_pooling1d/Max?
'text_cnn/conv1d_1/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2)
'text_cnn/conv1d_1/conv1d/ExpandDims/dim?
#text_cnn/conv1d_1/conv1d/ExpandDims
ExpandDims5text_cnn/embedding/embedding_lookup/Identity:output:00text_cnn/conv1d_1/conv1d/ExpandDims/dim:output:0*
T0*1
_output_shapes
:??????????'?2%
#text_cnn/conv1d_1/conv1d/ExpandDims?
4text_cnn/conv1d_1/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp=text_cnn_conv1d_1_conv1d_expanddims_1_readvariableop_resource*$
_output_shapes
:??*
dtype026
4text_cnn/conv1d_1/conv1d/ExpandDims_1/ReadVariableOp?
)text_cnn/conv1d_1/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2+
)text_cnn/conv1d_1/conv1d/ExpandDims_1/dim?
%text_cnn/conv1d_1/conv1d/ExpandDims_1
ExpandDims<text_cnn/conv1d_1/conv1d/ExpandDims_1/ReadVariableOp:value:02text_cnn/conv1d_1/conv1d/ExpandDims_1/dim:output:0*
T0*(
_output_shapes
:??2'
%text_cnn/conv1d_1/conv1d/ExpandDims_1?
text_cnn/conv1d_1/conv1dConv2D,text_cnn/conv1d_1/conv1d/ExpandDims:output:0.text_cnn/conv1d_1/conv1d/ExpandDims_1:output:0*
T0*1
_output_shapes
:??????????'?*
paddingVALID*
strides
2
text_cnn/conv1d_1/conv1d?
 text_cnn/conv1d_1/conv1d/SqueezeSqueeze!text_cnn/conv1d_1/conv1d:output:0*
T0*-
_output_shapes
:??????????'?*
squeeze_dims
2"
 text_cnn/conv1d_1/conv1d/Squeeze?
(text_cnn/conv1d_1/BiasAdd/ReadVariableOpReadVariableOp1text_cnn_conv1d_1_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02*
(text_cnn/conv1d_1/BiasAdd/ReadVariableOp?
text_cnn/conv1d_1/BiasAddBiasAdd)text_cnn/conv1d_1/conv1d/Squeeze:output:00text_cnn/conv1d_1/BiasAdd/ReadVariableOp:value:0*
T0*-
_output_shapes
:??????????'?2
text_cnn/conv1d_1/BiasAdd?
text_cnn/conv1d_1/ReluRelu"text_cnn/conv1d_1/BiasAdd:output:0*
T0*-
_output_shapes
:??????????'?2
text_cnn/conv1d_1/Relu?
5text_cnn/global_max_pooling1d_1/Max/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :27
5text_cnn/global_max_pooling1d_1/Max/reduction_indices?
#text_cnn/global_max_pooling1d_1/MaxMax$text_cnn/conv1d_1/Relu:activations:0>text_cnn/global_max_pooling1d_1/Max/reduction_indices:output:0*
T0*(
_output_shapes
:??????????2%
#text_cnn/global_max_pooling1d_1/Max?
'text_cnn/conv1d_2/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2)
'text_cnn/conv1d_2/conv1d/ExpandDims/dim?
#text_cnn/conv1d_2/conv1d/ExpandDims
ExpandDims5text_cnn/embedding/embedding_lookup/Identity:output:00text_cnn/conv1d_2/conv1d/ExpandDims/dim:output:0*
T0*1
_output_shapes
:??????????'?2%
#text_cnn/conv1d_2/conv1d/ExpandDims?
4text_cnn/conv1d_2/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp=text_cnn_conv1d_2_conv1d_expanddims_1_readvariableop_resource*$
_output_shapes
:??*
dtype026
4text_cnn/conv1d_2/conv1d/ExpandDims_1/ReadVariableOp?
)text_cnn/conv1d_2/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2+
)text_cnn/conv1d_2/conv1d/ExpandDims_1/dim?
%text_cnn/conv1d_2/conv1d/ExpandDims_1
ExpandDims<text_cnn/conv1d_2/conv1d/ExpandDims_1/ReadVariableOp:value:02text_cnn/conv1d_2/conv1d/ExpandDims_1/dim:output:0*
T0*(
_output_shapes
:??2'
%text_cnn/conv1d_2/conv1d/ExpandDims_1?
text_cnn/conv1d_2/conv1dConv2D,text_cnn/conv1d_2/conv1d/ExpandDims:output:0.text_cnn/conv1d_2/conv1d/ExpandDims_1:output:0*
T0*1
_output_shapes
:??????????'?*
paddingVALID*
strides
2
text_cnn/conv1d_2/conv1d?
 text_cnn/conv1d_2/conv1d/SqueezeSqueeze!text_cnn/conv1d_2/conv1d:output:0*
T0*-
_output_shapes
:??????????'?*
squeeze_dims
2"
 text_cnn/conv1d_2/conv1d/Squeeze?
(text_cnn/conv1d_2/BiasAdd/ReadVariableOpReadVariableOp1text_cnn_conv1d_2_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02*
(text_cnn/conv1d_2/BiasAdd/ReadVariableOp?
text_cnn/conv1d_2/BiasAddBiasAdd)text_cnn/conv1d_2/conv1d/Squeeze:output:00text_cnn/conv1d_2/BiasAdd/ReadVariableOp:value:0*
T0*-
_output_shapes
:??????????'?2
text_cnn/conv1d_2/BiasAdd?
text_cnn/conv1d_2/ReluRelu"text_cnn/conv1d_2/BiasAdd:output:0*
T0*-
_output_shapes
:??????????'?2
text_cnn/conv1d_2/Relu?
5text_cnn/global_max_pooling1d_2/Max/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :27
5text_cnn/global_max_pooling1d_2/Max/reduction_indices?
#text_cnn/global_max_pooling1d_2/MaxMax$text_cnn/conv1d_2/Relu:activations:0>text_cnn/global_max_pooling1d_2/Max/reduction_indices:output:0*
T0*(
_output_shapes
:??????????2%
#text_cnn/global_max_pooling1d_2/Max?
 text_cnn/concatenate/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2"
 text_cnn/concatenate/concat/axis?
text_cnn/concatenate/concatConcatV2*text_cnn/global_max_pooling1d/Max:output:0,text_cnn/global_max_pooling1d_1/Max:output:0,text_cnn/global_max_pooling1d_2/Max:output:0)text_cnn/concatenate/concat/axis:output:0*
N*
T0*(
_output_shapes
:??????????2
text_cnn/concatenate/concat?
$text_cnn/dense/MatMul/ReadVariableOpReadVariableOp-text_cnn_dense_matmul_readvariableop_resource*
_output_shapes
:	?*
dtype02&
$text_cnn/dense/MatMul/ReadVariableOp?
text_cnn/dense/MatMulMatMul$text_cnn/concatenate/concat:output:0,text_cnn/dense/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
text_cnn/dense/MatMul?
%text_cnn/dense/BiasAdd/ReadVariableOpReadVariableOp.text_cnn_dense_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02'
%text_cnn/dense/BiasAdd/ReadVariableOp?
text_cnn/dense/BiasAddBiasAddtext_cnn/dense/MatMul:product:0-text_cnn/dense/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
text_cnn/dense/BiasAdd?
text_cnn/dense/SoftmaxSoftmaxtext_cnn/dense/BiasAdd:output:0*
T0*'
_output_shapes
:?????????2
text_cnn/dense/Softmaxt
IdentityIdentity text_cnn/dense/Softmax:softmax:0*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*K
_input_shapes:
8:??????????'::::::::::Q M
(
_output_shapes
:??????????'
!
_user_specified_name	input_1:

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :	

_output_shapes
: 
?
|
'__inference_conv1d_1_layer_call_fn_5845

inputs
unknown
	unknown_0
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*5
_output_shapes#
!:???????????????????*$
_read_only_resource_inputs
**
config_proto

CPU

GPU 2J 8*K
fFRD
B__inference_conv1d_1_layer_call_and_return_conditional_losses_58352
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*5
_output_shapes#
!:???????????????????2

Identity"
identityIdentity:output:0*<
_input_shapes+
):???????????????????::22
StatefulPartitionedCallStatefulPartitionedCall:] Y
5
_output_shapes#
!:???????????????????
 
_user_specified_nameinputs:

_output_shapes
: :

_output_shapes
: 
?
l
P__inference_global_max_pooling1d_2_layer_call_and_return_conditional_losses_5905

inputs
identityp
Max/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Max/reduction_indicest
MaxMaxinputsMax/reduction_indices:output:0*
T0*0
_output_shapes
:??????????????????2
Maxi
IdentityIdentityMax:output:0*
T0*0
_output_shapes
:??????????????????2

Identity"
identityIdentity:output:0*<
_input_shapes+
):'???????????????????????????:e a
=
_output_shapes+
):'???????????????????????????
 
_user_specified_nameinputs
?
y
$__inference_dense_layer_call_fn_6086

inputs
unknown
	unknown_0
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*'
_output_shapes
:?????????*$
_read_only_resource_inputs
**
config_proto

CPU

GPU 2J 8*H
fCRA
?__inference_dense_layer_call_and_return_conditional_losses_59752
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*/
_input_shapes
:??????????::22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs:

_output_shapes
: :

_output_shapes
: 
?
Q
5__inference_global_max_pooling1d_2_layer_call_fn_5911

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*0
_output_shapes
:??????????????????* 
_read_only_resource_inputs
 **
config_proto

CPU

GPU 2J 8*Y
fTRR
P__inference_global_max_pooling1d_2_layer_call_and_return_conditional_losses_59052
PartitionedCallu
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:??????????????????2

Identity"
identityIdentity:output:0*<
_input_shapes+
):'???????????????????????????:e a
=
_output_shapes+
):'???????????????????????????
 
_user_specified_nameinputs
?	
?
C__inference_embedding_layer_call_and_return_conditional_losses_5924

inputs,
(embedding_lookup_readvariableop_resource
identity??
embedding_lookup/ReadVariableOpReadVariableOp(embedding_lookup_readvariableop_resource* 
_output_shapes
:
?>?*
dtype02!
embedding_lookup/ReadVariableOp?
embedding_lookup/axisConst*2
_class(
&$loc:@embedding_lookup/ReadVariableOp*
_output_shapes
: *
dtype0*
value	B : 2
embedding_lookup/axis?
embedding_lookupGatherV2'embedding_lookup/ReadVariableOp:value:0inputsembedding_lookup/axis:output:0*
Taxis0*
Tindices0*
Tparams0*2
_class(
&$loc:@embedding_lookup/ReadVariableOp*-
_output_shapes
:??????????'?2
embedding_lookup?
embedding_lookup/IdentityIdentityembedding_lookup:output:0*
T0*-
_output_shapes
:??????????'?2
embedding_lookup/Identity|
IdentityIdentity"embedding_lookup/Identity:output:0*
T0*-
_output_shapes
:??????????'?2

Identity"
identityIdentity:output:0*+
_input_shapes
:??????????'::P L
(
_output_shapes
:??????????'
 
_user_specified_nameinputs:

_output_shapes
: 
?

?
"__inference_signature_wrapper_6050
input_1
unknown
	unknown_0
	unknown_1
	unknown_2
	unknown_3
	unknown_4
	unknown_5
	unknown_6
	unknown_7
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7*
Tin
2
*
Tout
2*'
_output_shapes
:?????????*+
_read_only_resource_inputs
		**
config_proto

CPU

GPU 2J 8*(
f#R!
__inference__wrapped_model_57912
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*K
_input_shapes:
8:??????????':::::::::22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:??????????'
!
_user_specified_name	input_1:

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :	

_output_shapes
: 
?

?
'__inference_text_cnn_layer_call_fn_6017
input_1
unknown
	unknown_0
	unknown_1
	unknown_2
	unknown_3
	unknown_4
	unknown_5
	unknown_6
	unknown_7
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7*
Tin
2
*
Tout
2*'
_output_shapes
:?????????*+
_read_only_resource_inputs
		**
config_proto

CPU

GPU 2J 8*K
fFRD
B__inference_text_cnn_layer_call_and_return_conditional_losses_59932
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*K
_input_shapes:
8:??????????':::::::::22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:??????????'
!
_user_specified_name	input_1:

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :	

_output_shapes
: 
?
?
B__inference_conv1d_2_layer_call_and_return_conditional_losses_5862

inputs/
+conv1d_expanddims_1_readvariableop_resource#
biasadd_readvariableop_resource
identity?p
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2
conv1d/ExpandDims/dim?
conv1d/ExpandDims
ExpandDimsinputsconv1d/ExpandDims/dim:output:0*
T0*9
_output_shapes'
%:#???????????????????2
conv1d/ExpandDims?
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*$
_output_shapes
:??*
dtype02$
"conv1d/ExpandDims_1/ReadVariableOpt
conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/ExpandDims_1/dim?
conv1d/ExpandDims_1
ExpandDims*conv1d/ExpandDims_1/ReadVariableOp:value:0 conv1d/ExpandDims_1/dim:output:0*
T0*(
_output_shapes
:??2
conv1d/ExpandDims_1?
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*9
_output_shapes'
%:#???????????????????*
paddingVALID*
strides
2
conv1d?
conv1d/SqueezeSqueezeconv1d:output:0*
T0*5
_output_shapes#
!:???????????????????*
squeeze_dims
2
conv1d/Squeeze?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddconv1d/Squeeze:output:0BiasAdd/ReadVariableOp:value:0*
T0*5
_output_shapes#
!:???????????????????2	
BiasAddf
ReluReluBiasAdd:output:0*
T0*5
_output_shapes#
!:???????????????????2
Relut
IdentityIdentityRelu:activations:0*
T0*5
_output_shapes#
!:???????????????????2

Identity"
identityIdentity:output:0*<
_input_shapes+
):???????????????????:::] Y
5
_output_shapes#
!:???????????????????
 
_user_specified_nameinputs:

_output_shapes
: :

_output_shapes
: 
?
?
?__inference_dense_layer_call_and_return_conditional_losses_6077

inputs"
matmul_readvariableop_resource#
biasadd_readvariableop_resource
identity??
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	?*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
MatMul?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2	
BiasAdda
SoftmaxSoftmaxBiasAdd:output:0*
T0*'
_output_shapes
:?????????2	
Softmaxe
IdentityIdentitySoftmax:softmax:0*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*/
_input_shapes
:??????????:::P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs:

_output_shapes
: :

_output_shapes
: 
?
z
%__inference_conv1d_layer_call_fn_5818

inputs
unknown
	unknown_0
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*5
_output_shapes#
!:???????????????????*$
_read_only_resource_inputs
**
config_proto

CPU

GPU 2J 8*I
fDRB
@__inference_conv1d_layer_call_and_return_conditional_losses_58082
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*5
_output_shapes#
!:???????????????????2

Identity"
identityIdentity:output:0*<
_input_shapes+
):???????????????????::22
StatefulPartitionedCallStatefulPartitionedCall:] Y
5
_output_shapes#
!:???????????????????
 
_user_specified_nameinputs:

_output_shapes
: :

_output_shapes
: 
?
|
'__inference_conv1d_2_layer_call_fn_5872

inputs
unknown
	unknown_0
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*5
_output_shapes#
!:???????????????????*$
_read_only_resource_inputs
**
config_proto

CPU

GPU 2J 8*K
fFRD
B__inference_conv1d_2_layer_call_and_return_conditional_losses_58622
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*5
_output_shapes#
!:???????????????????2

Identity"
identityIdentity:output:0*<
_input_shapes+
):???????????????????::22
StatefulPartitionedCallStatefulPartitionedCall:] Y
5
_output_shapes#
!:???????????????????
 
_user_specified_nameinputs:

_output_shapes
: :

_output_shapes
: 
?
O
3__inference_global_max_pooling1d_layer_call_fn_5885

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*0
_output_shapes
:??????????????????* 
_read_only_resource_inputs
 **
config_proto

CPU

GPU 2J 8*W
fRRP
N__inference_global_max_pooling1d_layer_call_and_return_conditional_losses_58792
PartitionedCallu
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:??????????????????2

Identity"
identityIdentity:output:0*<
_input_shapes+
):'???????????????????????????:e a
=
_output_shapes+
):'???????????????????????????
 
_user_specified_nameinputs
?
Q
5__inference_global_max_pooling1d_1_layer_call_fn_5898

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*0
_output_shapes
:??????????????????* 
_read_only_resource_inputs
 **
config_proto

CPU

GPU 2J 8*Y
fTRR
P__inference_global_max_pooling1d_1_layer_call_and_return_conditional_losses_58922
PartitionedCallu
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:??????????????????2

Identity"
identityIdentity:output:0*<
_input_shapes+
):'???????????????????????????:e a
=
_output_shapes+
):'???????????????????????????
 
_user_specified_nameinputs
?V
?
__inference__traced_save_6221
file_prefix<
8savev2_text_cnn_embedding_embeddings_read_readvariableop4
0savev2_text_cnn_dense_kernel_read_readvariableop2
.savev2_text_cnn_dense_bias_read_readvariableop(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableop5
1savev2_text_cnn_conv1d_kernel_read_readvariableop3
/savev2_text_cnn_conv1d_bias_read_readvariableop7
3savev2_text_cnn_conv1d_1_kernel_read_readvariableop5
1savev2_text_cnn_conv1d_1_bias_read_readvariableop7
3savev2_text_cnn_conv1d_2_kernel_read_readvariableop5
1savev2_text_cnn_conv1d_2_bias_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop&
"savev2_total_1_read_readvariableop&
"savev2_count_1_read_readvariableopC
?savev2_adam_text_cnn_embedding_embeddings_m_read_readvariableop;
7savev2_adam_text_cnn_dense_kernel_m_read_readvariableop9
5savev2_adam_text_cnn_dense_bias_m_read_readvariableop<
8savev2_adam_text_cnn_conv1d_kernel_m_read_readvariableop:
6savev2_adam_text_cnn_conv1d_bias_m_read_readvariableop>
:savev2_adam_text_cnn_conv1d_1_kernel_m_read_readvariableop<
8savev2_adam_text_cnn_conv1d_1_bias_m_read_readvariableop>
:savev2_adam_text_cnn_conv1d_2_kernel_m_read_readvariableop<
8savev2_adam_text_cnn_conv1d_2_bias_m_read_readvariableopC
?savev2_adam_text_cnn_embedding_embeddings_v_read_readvariableop;
7savev2_adam_text_cnn_dense_kernel_v_read_readvariableop9
5savev2_adam_text_cnn_dense_bias_v_read_readvariableop<
8savev2_adam_text_cnn_conv1d_kernel_v_read_readvariableop:
6savev2_adam_text_cnn_conv1d_bias_v_read_readvariableop>
:savev2_adam_text_cnn_conv1d_1_kernel_v_read_readvariableop<
8savev2_adam_text_cnn_conv1d_1_bias_v_read_readvariableop>
:savev2_adam_text_cnn_conv1d_2_kernel_v_read_readvariableop<
8savev2_adam_text_cnn_conv1d_2_bias_v_read_readvariableop
savev2_1_const

identity_1??MergeV2Checkpoints?SaveV2?SaveV2_1?
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*2
StaticRegexFullMatchc
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.part2
Const?
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*<
value3B1 B+_temp_2c7c67687f1d43239eb8fe344bd41ae1/part2	
Const_1?
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: 2
Selectt

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: 2

StringJoinZ

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :2

num_shards
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 2
ShardedFilename/shard?
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: 2
ShardedFilename?
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:$*
dtype0*?
value?B?$B/embedding/embeddings/.ATTRIBUTES/VARIABLE_VALUEB,classifier/kernel/.ATTRIBUTES/VARIABLE_VALUEB*classifier/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/5/.ATTRIBUTES/VARIABLE_VALUEB&variables/6/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBKembedding/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBHclassifier/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBFclassifier/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/5/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/6/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBKembedding/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBHclassifier/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBFclassifier/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/5/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/6/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE2
SaveV2/tensor_names?
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:$*
dtype0*[
valueRBP$B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 2
SaveV2/shape_and_slices?
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:08savev2_text_cnn_embedding_embeddings_read_readvariableop0savev2_text_cnn_dense_kernel_read_readvariableop.savev2_text_cnn_dense_bias_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop1savev2_text_cnn_conv1d_kernel_read_readvariableop/savev2_text_cnn_conv1d_bias_read_readvariableop3savev2_text_cnn_conv1d_1_kernel_read_readvariableop1savev2_text_cnn_conv1d_1_bias_read_readvariableop3savev2_text_cnn_conv1d_2_kernel_read_readvariableop1savev2_text_cnn_conv1d_2_bias_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop"savev2_total_1_read_readvariableop"savev2_count_1_read_readvariableop?savev2_adam_text_cnn_embedding_embeddings_m_read_readvariableop7savev2_adam_text_cnn_dense_kernel_m_read_readvariableop5savev2_adam_text_cnn_dense_bias_m_read_readvariableop8savev2_adam_text_cnn_conv1d_kernel_m_read_readvariableop6savev2_adam_text_cnn_conv1d_bias_m_read_readvariableop:savev2_adam_text_cnn_conv1d_1_kernel_m_read_readvariableop8savev2_adam_text_cnn_conv1d_1_bias_m_read_readvariableop:savev2_adam_text_cnn_conv1d_2_kernel_m_read_readvariableop8savev2_adam_text_cnn_conv1d_2_bias_m_read_readvariableop?savev2_adam_text_cnn_embedding_embeddings_v_read_readvariableop7savev2_adam_text_cnn_dense_kernel_v_read_readvariableop5savev2_adam_text_cnn_dense_bias_v_read_readvariableop8savev2_adam_text_cnn_conv1d_kernel_v_read_readvariableop6savev2_adam_text_cnn_conv1d_bias_v_read_readvariableop:savev2_adam_text_cnn_conv1d_1_kernel_v_read_readvariableop8savev2_adam_text_cnn_conv1d_1_bias_v_read_readvariableop:savev2_adam_text_cnn_conv1d_2_kernel_v_read_readvariableop8savev2_adam_text_cnn_conv1d_2_bias_v_read_readvariableop"/device:CPU:0*
_output_shapes
 *2
dtypes(
&2$	2
SaveV2?
ShardedFilename_1/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B :2
ShardedFilename_1/shard?
ShardedFilename_1ShardedFilenameStringJoin:output:0 ShardedFilename_1/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: 2
ShardedFilename_1?
SaveV2_1/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*1
value(B&B_CHECKPOINTABLE_OBJECT_GRAPH2
SaveV2_1/tensor_names?
SaveV2_1/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*
valueB
B 2
SaveV2_1/shape_and_slices?
SaveV2_1SaveV2ShardedFilename_1:filename:0SaveV2_1/tensor_names:output:0"SaveV2_1/shape_and_slices:output:0savev2_1_const^SaveV2"/device:CPU:0*
_output_shapes
 *
dtypes
22

SaveV2_1?
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0ShardedFilename_1:filename:0^SaveV2	^SaveV2_1"/device:CPU:0*
N*
T0*
_output_shapes
:2(
&MergeV2Checkpoints/checkpoint_prefixes?
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix	^SaveV2_1"/device:CPU:0*
_output_shapes
 2
MergeV2Checkpointsr
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: 2

Identity?

Identity_1IdentityIdentity:output:0^MergeV2Checkpoints^SaveV2	^SaveV2_1*
T0*
_output_shapes
: 2

Identity_1"!

identity_1Identity_1:output:0*?
_input_shapes?
?: :
?>?:	?:: : : : : :??:?:??:?:??:?: : : : :
?>?:	?::??:?:??:?:??:?:
?>?:	?::??:?:??:?:??:?: 2(
MergeV2CheckpointsMergeV2Checkpoints2
SaveV2SaveV22
SaveV2_1SaveV2_1:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:&"
 
_output_shapes
:
?>?:%!

_output_shapes
:	?: 

_output_shapes
::

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :*	&
$
_output_shapes
:??:!


_output_shapes	
:?:*&
$
_output_shapes
:??:!

_output_shapes	
:?:*&
$
_output_shapes
:??:!

_output_shapes	
:?:

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :&"
 
_output_shapes
:
?>?:%!

_output_shapes
:	?: 

_output_shapes
::*&
$
_output_shapes
:??:!

_output_shapes	
:?:*&
$
_output_shapes
:??:!

_output_shapes	
:?:*&
$
_output_shapes
:??:!

_output_shapes	
:?:&"
 
_output_shapes
:
?>?:%!

_output_shapes
:	?: 

_output_shapes
::*&
$
_output_shapes
:??:! 

_output_shapes	
:?:*!&
$
_output_shapes
:??:!"

_output_shapes	
:?:*#&
$
_output_shapes
:??:!$

_output_shapes	
:?:%

_output_shapes
: 
?	
?
C__inference_embedding_layer_call_and_return_conditional_losses_6059

inputs,
(embedding_lookup_readvariableop_resource
identity??
embedding_lookup/ReadVariableOpReadVariableOp(embedding_lookup_readvariableop_resource* 
_output_shapes
:
?>?*
dtype02!
embedding_lookup/ReadVariableOp?
embedding_lookup/axisConst*2
_class(
&$loc:@embedding_lookup/ReadVariableOp*
_output_shapes
: *
dtype0*
value	B : 2
embedding_lookup/axis?
embedding_lookupGatherV2'embedding_lookup/ReadVariableOp:value:0inputsembedding_lookup/axis:output:0*
Taxis0*
Tindices0*
Tparams0*2
_class(
&$loc:@embedding_lookup/ReadVariableOp*-
_output_shapes
:??????????'?2
embedding_lookup?
embedding_lookup/IdentityIdentityembedding_lookup:output:0*
T0*-
_output_shapes
:??????????'?2
embedding_lookup/Identity|
IdentityIdentity"embedding_lookup/Identity:output:0*
T0*-
_output_shapes
:??????????'?2

Identity"
identityIdentity:output:0*+
_input_shapes
:??????????'::P L
(
_output_shapes
:??????????'
 
_user_specified_nameinputs:

_output_shapes
: 
?
?
B__inference_conv1d_1_layer_call_and_return_conditional_losses_5835

inputs/
+conv1d_expanddims_1_readvariableop_resource#
biasadd_readvariableop_resource
identity?p
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2
conv1d/ExpandDims/dim?
conv1d/ExpandDims
ExpandDimsinputsconv1d/ExpandDims/dim:output:0*
T0*9
_output_shapes'
%:#???????????????????2
conv1d/ExpandDims?
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*$
_output_shapes
:??*
dtype02$
"conv1d/ExpandDims_1/ReadVariableOpt
conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/ExpandDims_1/dim?
conv1d/ExpandDims_1
ExpandDims*conv1d/ExpandDims_1/ReadVariableOp:value:0 conv1d/ExpandDims_1/dim:output:0*
T0*(
_output_shapes
:??2
conv1d/ExpandDims_1?
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*9
_output_shapes'
%:#???????????????????*
paddingVALID*
strides
2
conv1d?
conv1d/SqueezeSqueezeconv1d:output:0*
T0*5
_output_shapes#
!:???????????????????*
squeeze_dims
2
conv1d/Squeeze?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddconv1d/Squeeze:output:0BiasAdd/ReadVariableOp:value:0*
T0*5
_output_shapes#
!:???????????????????2	
BiasAddf
ReluReluBiasAdd:output:0*
T0*5
_output_shapes#
!:???????????????????2
Relut
IdentityIdentityRelu:activations:0*
T0*5
_output_shapes#
!:???????????????????2

Identity"
identityIdentity:output:0*<
_input_shapes+
):???????????????????:::] Y
5
_output_shapes#
!:???????????????????
 
_user_specified_nameinputs:

_output_shapes
: :

_output_shapes
: 
?
?
@__inference_conv1d_layer_call_and_return_conditional_losses_5808

inputs/
+conv1d_expanddims_1_readvariableop_resource#
biasadd_readvariableop_resource
identity?p
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2
conv1d/ExpandDims/dim?
conv1d/ExpandDims
ExpandDimsinputsconv1d/ExpandDims/dim:output:0*
T0*9
_output_shapes'
%:#???????????????????2
conv1d/ExpandDims?
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*$
_output_shapes
:??*
dtype02$
"conv1d/ExpandDims_1/ReadVariableOpt
conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/ExpandDims_1/dim?
conv1d/ExpandDims_1
ExpandDims*conv1d/ExpandDims_1/ReadVariableOp:value:0 conv1d/ExpandDims_1/dim:output:0*
T0*(
_output_shapes
:??2
conv1d/ExpandDims_1?
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*9
_output_shapes'
%:#???????????????????*
paddingVALID*
strides
2
conv1d?
conv1d/SqueezeSqueezeconv1d:output:0*
T0*5
_output_shapes#
!:???????????????????*
squeeze_dims
2
conv1d/Squeeze?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddconv1d/Squeeze:output:0BiasAdd/ReadVariableOp:value:0*
T0*5
_output_shapes#
!:???????????????????2	
BiasAddf
ReluReluBiasAdd:output:0*
T0*5
_output_shapes#
!:???????????????????2
Relut
IdentityIdentityRelu:activations:0*
T0*5
_output_shapes#
!:???????????????????2

Identity"
identityIdentity:output:0*<
_input_shapes+
):???????????????????:::] Y
5
_output_shapes#
!:???????????????????
 
_user_specified_nameinputs:

_output_shapes
: :

_output_shapes
: 
?
j
N__inference_global_max_pooling1d_layer_call_and_return_conditional_losses_5879

inputs
identityp
Max/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Max/reduction_indicest
MaxMaxinputsMax/reduction_indices:output:0*
T0*0
_output_shapes
:??????????????????2
Maxi
IdentityIdentityMax:output:0*
T0*0
_output_shapes
:??????????????????2

Identity"
identityIdentity:output:0*<
_input_shapes+
):'???????????????????????????:e a
=
_output_shapes+
):'???????????????????????????
 
_user_specified_nameinputs
?
?
?__inference_dense_layer_call_and_return_conditional_losses_5975

inputs"
matmul_readvariableop_resource#
biasadd_readvariableop_resource
identity??
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	?*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
MatMul?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2	
BiasAdda
SoftmaxSoftmaxBiasAdd:output:0*
T0*'
_output_shapes
:?????????2	
Softmaxe
IdentityIdentitySoftmax:softmax:0*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*/
_input_shapes
:??????????:::P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs:

_output_shapes
: :

_output_shapes
: 
?
n
(__inference_embedding_layer_call_fn_6066

inputs
unknown
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*-
_output_shapes
:??????????'?*#
_read_only_resource_inputs
**
config_proto

CPU

GPU 2J 8*L
fGRE
C__inference_embedding_layer_call_and_return_conditional_losses_59242
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*-
_output_shapes
:??????????'?2

Identity"
identityIdentity:output:0*+
_input_shapes
:??????????':22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:??????????'
 
_user_specified_nameinputs:

_output_shapes
: 
?
l
P__inference_global_max_pooling1d_1_layer_call_and_return_conditional_losses_5892

inputs
identityp
Max/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :2
Max/reduction_indicest
MaxMaxinputsMax/reduction_indices:output:0*
T0*0
_output_shapes
:??????????????????2
Maxi
IdentityIdentityMax:output:0*
T0*0
_output_shapes
:??????????????????2

Identity"
identityIdentity:output:0*<
_input_shapes+
):'???????????????????????????:e a
=
_output_shapes+
):'???????????????????????????
 
_user_specified_nameinputs
?2
?
B__inference_text_cnn_layer_call_and_return_conditional_losses_5993
input_1
embedding_5933
conv1d_5937
conv1d_5939
conv1d_1_5945
conv1d_1_5947
conv1d_2_5953
conv1d_2_5955

dense_5986

dense_5988
identity??conv1d/StatefulPartitionedCall? conv1d_1/StatefulPartitionedCall? conv1d_2/StatefulPartitionedCall?dense/StatefulPartitionedCall?!embedding/StatefulPartitionedCall?
!embedding/StatefulPartitionedCallStatefulPartitionedCallinput_1embedding_5933*
Tin
2*
Tout
2*-
_output_shapes
:??????????'?*#
_read_only_resource_inputs
**
config_proto

CPU

GPU 2J 8*L
fGRE
C__inference_embedding_layer_call_and_return_conditional_losses_59242#
!embedding/StatefulPartitionedCall?
embedding/IdentityIdentity*embedding/StatefulPartitionedCall:output:0"^embedding/StatefulPartitionedCall*
T0*-
_output_shapes
:??????????'?2
embedding/Identity?
conv1d/StatefulPartitionedCallStatefulPartitionedCallembedding/Identity:output:0conv1d_5937conv1d_5939*
Tin
2*
Tout
2*-
_output_shapes
:??????????'?*$
_read_only_resource_inputs
**
config_proto

CPU

GPU 2J 8*I
fDRB
@__inference_conv1d_layer_call_and_return_conditional_losses_58082 
conv1d/StatefulPartitionedCall?
conv1d/IdentityIdentity'conv1d/StatefulPartitionedCall:output:0^conv1d/StatefulPartitionedCall*
T0*-
_output_shapes
:??????????'?2
conv1d/Identity?
$global_max_pooling1d/PartitionedCallPartitionedCallconv1d/Identity:output:0*
Tin
2*
Tout
2*(
_output_shapes
:??????????* 
_read_only_resource_inputs
 **
config_proto

CPU

GPU 2J 8*W
fRRP
N__inference_global_max_pooling1d_layer_call_and_return_conditional_losses_58792&
$global_max_pooling1d/PartitionedCall?
global_max_pooling1d/IdentityIdentity-global_max_pooling1d/PartitionedCall:output:0*
T0*(
_output_shapes
:??????????2
global_max_pooling1d/Identity?
 conv1d_1/StatefulPartitionedCallStatefulPartitionedCallembedding/Identity:output:0conv1d_1_5945conv1d_1_5947*
Tin
2*
Tout
2*-
_output_shapes
:??????????'?*$
_read_only_resource_inputs
**
config_proto

CPU

GPU 2J 8*K
fFRD
B__inference_conv1d_1_layer_call_and_return_conditional_losses_58352"
 conv1d_1/StatefulPartitionedCall?
conv1d_1/IdentityIdentity)conv1d_1/StatefulPartitionedCall:output:0!^conv1d_1/StatefulPartitionedCall*
T0*-
_output_shapes
:??????????'?2
conv1d_1/Identity?
&global_max_pooling1d_1/PartitionedCallPartitionedCallconv1d_1/Identity:output:0*
Tin
2*
Tout
2*(
_output_shapes
:??????????* 
_read_only_resource_inputs
 **
config_proto

CPU

GPU 2J 8*Y
fTRR
P__inference_global_max_pooling1d_1_layer_call_and_return_conditional_losses_58922(
&global_max_pooling1d_1/PartitionedCall?
global_max_pooling1d_1/IdentityIdentity/global_max_pooling1d_1/PartitionedCall:output:0*
T0*(
_output_shapes
:??????????2!
global_max_pooling1d_1/Identity?
 conv1d_2/StatefulPartitionedCallStatefulPartitionedCallembedding/Identity:output:0conv1d_2_5953conv1d_2_5955*
Tin
2*
Tout
2*-
_output_shapes
:??????????'?*$
_read_only_resource_inputs
**
config_proto

CPU

GPU 2J 8*K
fFRD
B__inference_conv1d_2_layer_call_and_return_conditional_losses_58622"
 conv1d_2/StatefulPartitionedCall?
conv1d_2/IdentityIdentity)conv1d_2/StatefulPartitionedCall:output:0!^conv1d_2/StatefulPartitionedCall*
T0*-
_output_shapes
:??????????'?2
conv1d_2/Identity?
&global_max_pooling1d_2/PartitionedCallPartitionedCallconv1d_2/Identity:output:0*
Tin
2*
Tout
2*(
_output_shapes
:??????????* 
_read_only_resource_inputs
 **
config_proto

CPU

GPU 2J 8*Y
fTRR
P__inference_global_max_pooling1d_2_layer_call_and_return_conditional_losses_59052(
&global_max_pooling1d_2/PartitionedCall?
global_max_pooling1d_2/IdentityIdentity/global_max_pooling1d_2/PartitionedCall:output:0*
T0*(
_output_shapes
:??????????2!
global_max_pooling1d_2/Identityt
concatenate/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concatenate/concat/axis?
concatenate/concatConcatV2&global_max_pooling1d/Identity:output:0(global_max_pooling1d_1/Identity:output:0(global_max_pooling1d_2/Identity:output:0 concatenate/concat/axis:output:0*
N*
T0*(
_output_shapes
:??????????2
concatenate/concat?
concatenate/IdentityIdentityconcatenate/concat:output:0*
T0*(
_output_shapes
:??????????2
concatenate/Identity?
dense/StatefulPartitionedCallStatefulPartitionedCallconcatenate/Identity:output:0
dense_5986
dense_5988*
Tin
2*
Tout
2*'
_output_shapes
:?????????*$
_read_only_resource_inputs
**
config_proto

CPU

GPU 2J 8*H
fCRA
?__inference_dense_layer_call_and_return_conditional_losses_59752
dense/StatefulPartitionedCall?
dense/IdentityIdentity&dense/StatefulPartitionedCall:output:0^dense/StatefulPartitionedCall*
T0*'
_output_shapes
:?????????2
dense/Identity?
IdentityIdentitydense/Identity:output:0^conv1d/StatefulPartitionedCall!^conv1d_1/StatefulPartitionedCall!^conv1d_2/StatefulPartitionedCall^dense/StatefulPartitionedCall"^embedding/StatefulPartitionedCall*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*K
_input_shapes:
8:??????????':::::::::2@
conv1d/StatefulPartitionedCallconv1d/StatefulPartitionedCall2D
 conv1d_1/StatefulPartitionedCall conv1d_1/StatefulPartitionedCall2D
 conv1d_2/StatefulPartitionedCall conv1d_2/StatefulPartitionedCall2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2F
!embedding/StatefulPartitionedCall!embedding/StatefulPartitionedCall:Q M
(
_output_shapes
:??????????'
!
_user_specified_name	input_1:

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :	

_output_shapes
: 
͝
?
 __inference__traced_restore_6341
file_prefix2
.assignvariableop_text_cnn_embedding_embeddings,
(assignvariableop_1_text_cnn_dense_kernel*
&assignvariableop_2_text_cnn_dense_bias 
assignvariableop_3_adam_iter"
assignvariableop_4_adam_beta_1"
assignvariableop_5_adam_beta_2!
assignvariableop_6_adam_decay)
%assignvariableop_7_adam_learning_rate-
)assignvariableop_8_text_cnn_conv1d_kernel+
'assignvariableop_9_text_cnn_conv1d_bias0
,assignvariableop_10_text_cnn_conv1d_1_kernel.
*assignvariableop_11_text_cnn_conv1d_1_bias0
,assignvariableop_12_text_cnn_conv1d_2_kernel.
*assignvariableop_13_text_cnn_conv1d_2_bias
assignvariableop_14_total
assignvariableop_15_count
assignvariableop_16_total_1
assignvariableop_17_count_1<
8assignvariableop_18_adam_text_cnn_embedding_embeddings_m4
0assignvariableop_19_adam_text_cnn_dense_kernel_m2
.assignvariableop_20_adam_text_cnn_dense_bias_m5
1assignvariableop_21_adam_text_cnn_conv1d_kernel_m3
/assignvariableop_22_adam_text_cnn_conv1d_bias_m7
3assignvariableop_23_adam_text_cnn_conv1d_1_kernel_m5
1assignvariableop_24_adam_text_cnn_conv1d_1_bias_m7
3assignvariableop_25_adam_text_cnn_conv1d_2_kernel_m5
1assignvariableop_26_adam_text_cnn_conv1d_2_bias_m<
8assignvariableop_27_adam_text_cnn_embedding_embeddings_v4
0assignvariableop_28_adam_text_cnn_dense_kernel_v2
.assignvariableop_29_adam_text_cnn_dense_bias_v5
1assignvariableop_30_adam_text_cnn_conv1d_kernel_v3
/assignvariableop_31_adam_text_cnn_conv1d_bias_v7
3assignvariableop_32_adam_text_cnn_conv1d_1_kernel_v5
1assignvariableop_33_adam_text_cnn_conv1d_1_bias_v7
3assignvariableop_34_adam_text_cnn_conv1d_2_kernel_v5
1assignvariableop_35_adam_text_cnn_conv1d_2_bias_v
identity_37??AssignVariableOp?AssignVariableOp_1?AssignVariableOp_10?AssignVariableOp_11?AssignVariableOp_12?AssignVariableOp_13?AssignVariableOp_14?AssignVariableOp_15?AssignVariableOp_16?AssignVariableOp_17?AssignVariableOp_18?AssignVariableOp_19?AssignVariableOp_2?AssignVariableOp_20?AssignVariableOp_21?AssignVariableOp_22?AssignVariableOp_23?AssignVariableOp_24?AssignVariableOp_25?AssignVariableOp_26?AssignVariableOp_27?AssignVariableOp_28?AssignVariableOp_29?AssignVariableOp_3?AssignVariableOp_30?AssignVariableOp_31?AssignVariableOp_32?AssignVariableOp_33?AssignVariableOp_34?AssignVariableOp_35?AssignVariableOp_4?AssignVariableOp_5?AssignVariableOp_6?AssignVariableOp_7?AssignVariableOp_8?AssignVariableOp_9?	RestoreV2?RestoreV2_1?
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:$*
dtype0*?
value?B?$B/embedding/embeddings/.ATTRIBUTES/VARIABLE_VALUEB,classifier/kernel/.ATTRIBUTES/VARIABLE_VALUEB*classifier/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/5/.ATTRIBUTES/VARIABLE_VALUEB&variables/6/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBKembedding/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBHclassifier/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBFclassifier/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/5/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/6/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBKembedding/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBHclassifier/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBFclassifier/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/5/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/6/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE2
RestoreV2/tensor_names?
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:$*
dtype0*[
valueRBP$B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 2
RestoreV2/shape_and_slices?
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*?
_output_shapes?
?::::::::::::::::::::::::::::::::::::*2
dtypes(
&2$	2
	RestoreV2X
IdentityIdentityRestoreV2:tensors:0*
T0*
_output_shapes
:2

Identity?
AssignVariableOpAssignVariableOp.assignvariableop_text_cnn_embedding_embeddingsIdentity:output:0*
_output_shapes
 *
dtype02
AssignVariableOp\

Identity_1IdentityRestoreV2:tensors:1*
T0*
_output_shapes
:2

Identity_1?
AssignVariableOp_1AssignVariableOp(assignvariableop_1_text_cnn_dense_kernelIdentity_1:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_1\

Identity_2IdentityRestoreV2:tensors:2*
T0*
_output_shapes
:2

Identity_2?
AssignVariableOp_2AssignVariableOp&assignvariableop_2_text_cnn_dense_biasIdentity_2:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_2\

Identity_3IdentityRestoreV2:tensors:3*
T0	*
_output_shapes
:2

Identity_3?
AssignVariableOp_3AssignVariableOpassignvariableop_3_adam_iterIdentity_3:output:0*
_output_shapes
 *
dtype0	2
AssignVariableOp_3\

Identity_4IdentityRestoreV2:tensors:4*
T0*
_output_shapes
:2

Identity_4?
AssignVariableOp_4AssignVariableOpassignvariableop_4_adam_beta_1Identity_4:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_4\

Identity_5IdentityRestoreV2:tensors:5*
T0*
_output_shapes
:2

Identity_5?
AssignVariableOp_5AssignVariableOpassignvariableop_5_adam_beta_2Identity_5:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_5\

Identity_6IdentityRestoreV2:tensors:6*
T0*
_output_shapes
:2

Identity_6?
AssignVariableOp_6AssignVariableOpassignvariableop_6_adam_decayIdentity_6:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_6\

Identity_7IdentityRestoreV2:tensors:7*
T0*
_output_shapes
:2

Identity_7?
AssignVariableOp_7AssignVariableOp%assignvariableop_7_adam_learning_rateIdentity_7:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_7\

Identity_8IdentityRestoreV2:tensors:8*
T0*
_output_shapes
:2

Identity_8?
AssignVariableOp_8AssignVariableOp)assignvariableop_8_text_cnn_conv1d_kernelIdentity_8:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_8\

Identity_9IdentityRestoreV2:tensors:9*
T0*
_output_shapes
:2

Identity_9?
AssignVariableOp_9AssignVariableOp'assignvariableop_9_text_cnn_conv1d_biasIdentity_9:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_9_
Identity_10IdentityRestoreV2:tensors:10*
T0*
_output_shapes
:2
Identity_10?
AssignVariableOp_10AssignVariableOp,assignvariableop_10_text_cnn_conv1d_1_kernelIdentity_10:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_10_
Identity_11IdentityRestoreV2:tensors:11*
T0*
_output_shapes
:2
Identity_11?
AssignVariableOp_11AssignVariableOp*assignvariableop_11_text_cnn_conv1d_1_biasIdentity_11:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_11_
Identity_12IdentityRestoreV2:tensors:12*
T0*
_output_shapes
:2
Identity_12?
AssignVariableOp_12AssignVariableOp,assignvariableop_12_text_cnn_conv1d_2_kernelIdentity_12:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_12_
Identity_13IdentityRestoreV2:tensors:13*
T0*
_output_shapes
:2
Identity_13?
AssignVariableOp_13AssignVariableOp*assignvariableop_13_text_cnn_conv1d_2_biasIdentity_13:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_13_
Identity_14IdentityRestoreV2:tensors:14*
T0*
_output_shapes
:2
Identity_14?
AssignVariableOp_14AssignVariableOpassignvariableop_14_totalIdentity_14:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_14_
Identity_15IdentityRestoreV2:tensors:15*
T0*
_output_shapes
:2
Identity_15?
AssignVariableOp_15AssignVariableOpassignvariableop_15_countIdentity_15:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_15_
Identity_16IdentityRestoreV2:tensors:16*
T0*
_output_shapes
:2
Identity_16?
AssignVariableOp_16AssignVariableOpassignvariableop_16_total_1Identity_16:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_16_
Identity_17IdentityRestoreV2:tensors:17*
T0*
_output_shapes
:2
Identity_17?
AssignVariableOp_17AssignVariableOpassignvariableop_17_count_1Identity_17:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_17_
Identity_18IdentityRestoreV2:tensors:18*
T0*
_output_shapes
:2
Identity_18?
AssignVariableOp_18AssignVariableOp8assignvariableop_18_adam_text_cnn_embedding_embeddings_mIdentity_18:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_18_
Identity_19IdentityRestoreV2:tensors:19*
T0*
_output_shapes
:2
Identity_19?
AssignVariableOp_19AssignVariableOp0assignvariableop_19_adam_text_cnn_dense_kernel_mIdentity_19:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_19_
Identity_20IdentityRestoreV2:tensors:20*
T0*
_output_shapes
:2
Identity_20?
AssignVariableOp_20AssignVariableOp.assignvariableop_20_adam_text_cnn_dense_bias_mIdentity_20:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_20_
Identity_21IdentityRestoreV2:tensors:21*
T0*
_output_shapes
:2
Identity_21?
AssignVariableOp_21AssignVariableOp1assignvariableop_21_adam_text_cnn_conv1d_kernel_mIdentity_21:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_21_
Identity_22IdentityRestoreV2:tensors:22*
T0*
_output_shapes
:2
Identity_22?
AssignVariableOp_22AssignVariableOp/assignvariableop_22_adam_text_cnn_conv1d_bias_mIdentity_22:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_22_
Identity_23IdentityRestoreV2:tensors:23*
T0*
_output_shapes
:2
Identity_23?
AssignVariableOp_23AssignVariableOp3assignvariableop_23_adam_text_cnn_conv1d_1_kernel_mIdentity_23:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_23_
Identity_24IdentityRestoreV2:tensors:24*
T0*
_output_shapes
:2
Identity_24?
AssignVariableOp_24AssignVariableOp1assignvariableop_24_adam_text_cnn_conv1d_1_bias_mIdentity_24:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_24_
Identity_25IdentityRestoreV2:tensors:25*
T0*
_output_shapes
:2
Identity_25?
AssignVariableOp_25AssignVariableOp3assignvariableop_25_adam_text_cnn_conv1d_2_kernel_mIdentity_25:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_25_
Identity_26IdentityRestoreV2:tensors:26*
T0*
_output_shapes
:2
Identity_26?
AssignVariableOp_26AssignVariableOp1assignvariableop_26_adam_text_cnn_conv1d_2_bias_mIdentity_26:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_26_
Identity_27IdentityRestoreV2:tensors:27*
T0*
_output_shapes
:2
Identity_27?
AssignVariableOp_27AssignVariableOp8assignvariableop_27_adam_text_cnn_embedding_embeddings_vIdentity_27:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_27_
Identity_28IdentityRestoreV2:tensors:28*
T0*
_output_shapes
:2
Identity_28?
AssignVariableOp_28AssignVariableOp0assignvariableop_28_adam_text_cnn_dense_kernel_vIdentity_28:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_28_
Identity_29IdentityRestoreV2:tensors:29*
T0*
_output_shapes
:2
Identity_29?
AssignVariableOp_29AssignVariableOp.assignvariableop_29_adam_text_cnn_dense_bias_vIdentity_29:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_29_
Identity_30IdentityRestoreV2:tensors:30*
T0*
_output_shapes
:2
Identity_30?
AssignVariableOp_30AssignVariableOp1assignvariableop_30_adam_text_cnn_conv1d_kernel_vIdentity_30:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_30_
Identity_31IdentityRestoreV2:tensors:31*
T0*
_output_shapes
:2
Identity_31?
AssignVariableOp_31AssignVariableOp/assignvariableop_31_adam_text_cnn_conv1d_bias_vIdentity_31:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_31_
Identity_32IdentityRestoreV2:tensors:32*
T0*
_output_shapes
:2
Identity_32?
AssignVariableOp_32AssignVariableOp3assignvariableop_32_adam_text_cnn_conv1d_1_kernel_vIdentity_32:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_32_
Identity_33IdentityRestoreV2:tensors:33*
T0*
_output_shapes
:2
Identity_33?
AssignVariableOp_33AssignVariableOp1assignvariableop_33_adam_text_cnn_conv1d_1_bias_vIdentity_33:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_33_
Identity_34IdentityRestoreV2:tensors:34*
T0*
_output_shapes
:2
Identity_34?
AssignVariableOp_34AssignVariableOp3assignvariableop_34_adam_text_cnn_conv1d_2_kernel_vIdentity_34:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_34_
Identity_35IdentityRestoreV2:tensors:35*
T0*
_output_shapes
:2
Identity_35?
AssignVariableOp_35AssignVariableOp1assignvariableop_35_adam_text_cnn_conv1d_2_bias_vIdentity_35:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_35?
RestoreV2_1/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*1
value(B&B_CHECKPOINTABLE_OBJECT_GRAPH2
RestoreV2_1/tensor_names?
RestoreV2_1/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*
valueB
B 2
RestoreV2_1/shape_and_slices?
RestoreV2_1	RestoreV2file_prefix!RestoreV2_1/tensor_names:output:0%RestoreV2_1/shape_and_slices:output:0
^RestoreV2"/device:CPU:0*
_output_shapes
:*
dtypes
22
RestoreV2_19
NoOpNoOp"/device:CPU:0*
_output_shapes
 2
NoOp?
Identity_36Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: 2
Identity_36?
Identity_37IdentityIdentity_36:output:0^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9
^RestoreV2^RestoreV2_1*
T0*
_output_shapes
: 2
Identity_37"#
identity_37Identity_37:output:0*?
_input_shapes?
?: ::::::::::::::::::::::::::::::::::::2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262*
AssignVariableOp_27AssignVariableOp_272*
AssignVariableOp_28AssignVariableOp_282*
AssignVariableOp_29AssignVariableOp_292(
AssignVariableOp_3AssignVariableOp_32*
AssignVariableOp_30AssignVariableOp_302*
AssignVariableOp_31AssignVariableOp_312*
AssignVariableOp_32AssignVariableOp_322*
AssignVariableOp_33AssignVariableOp_332*
AssignVariableOp_34AssignVariableOp_342*
AssignVariableOp_35AssignVariableOp_352(
AssignVariableOp_4AssignVariableOp_42(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_92
	RestoreV2	RestoreV22
RestoreV2_1RestoreV2_1:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :	

_output_shapes
: :


_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: : 

_output_shapes
: :!

_output_shapes
: :"

_output_shapes
: :#

_output_shapes
: :$

_output_shapes
: "?L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*?
serving_default?
<
input_11
serving_default_input_1:0??????????'<
output_10
StatefulPartitionedCall:0?????????tensorflow/serving/predict:??
?
kernel_sizes
	embedding
	convs
max_poolings

classifier
	optimizer
	variables
regularization_losses
	trainable_variables

	keras_api

signatures
?__call__
+?&call_and_return_all_conditional_losses
?_default_save_signature"?
_tf_keras_model?{"class_name": "TextCNN", "name": "text_cnn", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "config": {"layer was saved without config": true}, "is_graph_network": false, "keras_version": "2.3.0-tf", "backend": "tensorflow", "model_config": {"class_name": "TextCNN"}, "training_config": {"loss": "binary_crossentropy", "metrics": ["accuracy"], "weighted_metrics": null, "loss_weights": null, "sample_weight_mode": null, "optimizer_config": {"class_name": "Adam", "config": {"name": "Adam", "learning_rate": 0.0010000000474974513, "decay": 0.0, "beta_1": 0.8999999761581421, "beta_2": 0.9990000128746033, "epsilon": 1e-07, "amsgrad": false}}}}
 "
trackable_list_wrapper
?

embeddings
	variables
regularization_losses
trainable_variables
	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?
_tf_keras_layer?{"class_name": "Embedding", "name": "embedding", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": {"class_name": "__tuple__", "items": [null, 5000]}, "stateful": false, "config": {"name": "embedding", "trainable": true, "batch_input_shape": {"class_name": "__tuple__", "items": [null, 5000]}, "dtype": "float32", "input_dim": 8000, "output_dim": 300, "embeddings_initializer": {"class_name": "RandomUniform", "config": {"minval": -0.05, "maxval": 0.05, "seed": null}}, "embeddings_regularizer": null, "activity_regularizer": null, "embeddings_constraint": null, "mask_zero": false, "input_length": 5000}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 5000]}}
5
0
1
2"
trackable_list_wrapper
5
0
1
2"
trackable_list_wrapper
?

kernel
bias
	variables
regularization_losses
trainable_variables
	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?
_tf_keras_layer?{"class_name": "Dense", "name": "dense", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "config": {"name": "dense", "trainable": true, "dtype": "float32", "units": 2, "activation": "softmax", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 2, "axes": {"-1": 384}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 384]}}
?
iter

beta_1

beta_2
	 decay
!learning_ratemxmymz"m{#m|$m}%m~&m'm?v?v?v?"v?#v?$v?%v?&v?'v?"
	optimizer
_
0
"1
#2
$3
%4
&5
'6
7
8"
trackable_list_wrapper
 "
trackable_list_wrapper
_
0
"1
#2
$3
%4
&5
'6
7
8"
trackable_list_wrapper
?
	variables
(non_trainable_variables
)layer_metrics
regularization_losses
*layer_regularization_losses
	trainable_variables
+metrics

,layers
?__call__
?_default_save_signature
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
-
?serving_default"
signature_map
1:/
?>?2text_cnn/embedding/embeddings
'
0"
trackable_list_wrapper
 "
trackable_list_wrapper
'
0"
trackable_list_wrapper
?
	variables
-non_trainable_variables
.layer_metrics
regularization_losses
/layer_regularization_losses
trainable_variables
0metrics

1layers
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
?	

"kernel
#bias
2	variables
3regularization_losses
4trainable_variables
5	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?
_tf_keras_layer?{"class_name": "Conv1D", "name": "conv1d", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "config": {"name": "conv1d", "trainable": true, "dtype": "float32", "filters": 128, "kernel_size": {"class_name": "__tuple__", "items": [3]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1]}, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": 3, "max_ndim": null, "min_ndim": null, "axes": {"-1": 300}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 5000, 300]}}
?	

$kernel
%bias
6	variables
7regularization_losses
8trainable_variables
9	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?
_tf_keras_layer?{"class_name": "Conv1D", "name": "conv1d_1", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "config": {"name": "conv1d_1", "trainable": true, "dtype": "float32", "filters": 128, "kernel_size": {"class_name": "__tuple__", "items": [4]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1]}, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": 3, "max_ndim": null, "min_ndim": null, "axes": {"-1": 300}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 5000, 300]}}
?	

&kernel
'bias
:	variables
;regularization_losses
<trainable_variables
=	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?
_tf_keras_layer?{"class_name": "Conv1D", "name": "conv1d_2", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "config": {"name": "conv1d_2", "trainable": true, "dtype": "float32", "filters": 128, "kernel_size": {"class_name": "__tuple__", "items": [5]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1]}, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": 3, "max_ndim": null, "min_ndim": null, "axes": {"-1": 300}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 5000, 300]}}
?
>	variables
?regularization_losses
@trainable_variables
A	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?
_tf_keras_layer?{"class_name": "GlobalMaxPooling1D", "name": "global_max_pooling1d", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "config": {"name": "global_max_pooling1d", "trainable": true, "dtype": "float32", "data_format": "channels_last"}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": 3, "max_ndim": null, "min_ndim": null, "axes": {}}}}
?
B	variables
Cregularization_losses
Dtrainable_variables
E	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?
_tf_keras_layer?{"class_name": "GlobalMaxPooling1D", "name": "global_max_pooling1d_1", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "config": {"name": "global_max_pooling1d_1", "trainable": true, "dtype": "float32", "data_format": "channels_last"}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": 3, "max_ndim": null, "min_ndim": null, "axes": {}}}}
?
F	variables
Gregularization_losses
Htrainable_variables
I	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?
_tf_keras_layer?{"class_name": "GlobalMaxPooling1D", "name": "global_max_pooling1d_2", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "config": {"name": "global_max_pooling1d_2", "trainable": true, "dtype": "float32", "data_format": "channels_last"}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": 3, "max_ndim": null, "min_ndim": null, "axes": {}}}}
(:&	?2text_cnn/dense/kernel
!:2text_cnn/dense/bias
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
?
	variables
Jnon_trainable_variables
Klayer_metrics
regularization_losses
Llayer_regularization_losses
trainable_variables
Mmetrics

Nlayers
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
.:,??2text_cnn/conv1d/kernel
#:!?2text_cnn/conv1d/bias
0:.??2text_cnn/conv1d_1/kernel
%:#?2text_cnn/conv1d_1/bias
0:.??2text_cnn/conv1d_2/kernel
%:#?2text_cnn/conv1d_2/bias
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
.
O0
P1"
trackable_list_wrapper
X
0
1
2
3
4
5
6
7"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
.
"0
#1"
trackable_list_wrapper
 "
trackable_list_wrapper
.
"0
#1"
trackable_list_wrapper
?
2	variables
Qnon_trainable_variables
Rlayer_metrics
3regularization_losses
Slayer_regularization_losses
4trainable_variables
Tmetrics

Ulayers
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
.
$0
%1"
trackable_list_wrapper
 "
trackable_list_wrapper
.
$0
%1"
trackable_list_wrapper
?
6	variables
Vnon_trainable_variables
Wlayer_metrics
7regularization_losses
Xlayer_regularization_losses
8trainable_variables
Ymetrics

Zlayers
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
.
&0
'1"
trackable_list_wrapper
 "
trackable_list_wrapper
.
&0
'1"
trackable_list_wrapper
?
:	variables
[non_trainable_variables
\layer_metrics
;regularization_losses
]layer_regularization_losses
<trainable_variables
^metrics

_layers
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
>	variables
`non_trainable_variables
alayer_metrics
?regularization_losses
blayer_regularization_losses
@trainable_variables
cmetrics

dlayers
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
B	variables
enon_trainable_variables
flayer_metrics
Cregularization_losses
glayer_regularization_losses
Dtrainable_variables
hmetrics

ilayers
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
F	variables
jnon_trainable_variables
klayer_metrics
Gregularization_losses
llayer_regularization_losses
Htrainable_variables
mmetrics

nlayers
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
	ototal
	pcount
q	variables
r	keras_api"?
_tf_keras_metricj{"class_name": "Mean", "name": "loss", "dtype": "float32", "config": {"name": "loss", "dtype": "float32"}}
?
	stotal
	tcount
u
_fn_kwargs
v	variables
w	keras_api"?
_tf_keras_metric?{"class_name": "MeanMetricWrapper", "name": "accuracy", "dtype": "float32", "config": {"name": "accuracy", "dtype": "float32", "fn": "categorical_accuracy"}}
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
:  (2total
:  (2count
.
o0
p1"
trackable_list_wrapper
-
q	variables"
_generic_user_object
:  (2total
:  (2count
 "
trackable_dict_wrapper
.
s0
t1"
trackable_list_wrapper
-
v	variables"
_generic_user_object
6:4
?>?2$Adam/text_cnn/embedding/embeddings/m
-:+	?2Adam/text_cnn/dense/kernel/m
&:$2Adam/text_cnn/dense/bias/m
3:1??2Adam/text_cnn/conv1d/kernel/m
(:&?2Adam/text_cnn/conv1d/bias/m
5:3??2Adam/text_cnn/conv1d_1/kernel/m
*:(?2Adam/text_cnn/conv1d_1/bias/m
5:3??2Adam/text_cnn/conv1d_2/kernel/m
*:(?2Adam/text_cnn/conv1d_2/bias/m
6:4
?>?2$Adam/text_cnn/embedding/embeddings/v
-:+	?2Adam/text_cnn/dense/kernel/v
&:$2Adam/text_cnn/dense/bias/v
3:1??2Adam/text_cnn/conv1d/kernel/v
(:&?2Adam/text_cnn/conv1d/bias/v
5:3??2Adam/text_cnn/conv1d_1/kernel/v
*:(?2Adam/text_cnn/conv1d_1/bias/v
5:3??2Adam/text_cnn/conv1d_2/kernel/v
*:(?2Adam/text_cnn/conv1d_2/bias/v
?2?
'__inference_text_cnn_layer_call_fn_6017?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *'?$
"?
input_1??????????'
?2?
B__inference_text_cnn_layer_call_and_return_conditional_losses_5993?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *'?$
"?
input_1??????????'
?2?
__inference__wrapped_model_5791?
???
FullArgSpec
args? 
varargsjargs
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *'?$
"?
input_1??????????'
?2?
(__inference_embedding_layer_call_fn_6066?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
C__inference_embedding_layer_call_and_return_conditional_losses_6059?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
$__inference_dense_layer_call_fn_6086?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
?__inference_dense_layer_call_and_return_conditional_losses_6077?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
1B/
"__inference_signature_wrapper_6050input_1
?2?
%__inference_conv1d_layer_call_fn_5818?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *+?(
&?#???????????????????
?2?
@__inference_conv1d_layer_call_and_return_conditional_losses_5808?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *+?(
&?#???????????????????
?2?
'__inference_conv1d_1_layer_call_fn_5845?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *+?(
&?#???????????????????
?2?
B__inference_conv1d_1_layer_call_and_return_conditional_losses_5835?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *+?(
&?#???????????????????
?2?
'__inference_conv1d_2_layer_call_fn_5872?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *+?(
&?#???????????????????
?2?
B__inference_conv1d_2_layer_call_and_return_conditional_losses_5862?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *+?(
&?#???????????????????
?2?
3__inference_global_max_pooling1d_layer_call_fn_5885?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *3?0
.?+'???????????????????????????
?2?
N__inference_global_max_pooling1d_layer_call_and_return_conditional_losses_5879?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *3?0
.?+'???????????????????????????
?2?
5__inference_global_max_pooling1d_1_layer_call_fn_5898?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *3?0
.?+'???????????????????????????
?2?
P__inference_global_max_pooling1d_1_layer_call_and_return_conditional_losses_5892?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *3?0
.?+'???????????????????????????
?2?
5__inference_global_max_pooling1d_2_layer_call_fn_5911?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *3?0
.?+'???????????????????????????
?2?
P__inference_global_max_pooling1d_2_layer_call_and_return_conditional_losses_5905?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *3?0
.?+'????????????????????????????
__inference__wrapped_model_5791s	"#$%&'1?.
'?$
"?
input_1??????????'
? "3?0
.
output_1"?
output_1??????????
B__inference_conv1d_1_layer_call_and_return_conditional_losses_5835x$%=?:
3?0
.?+
inputs???????????????????
? "3?0
)?&
0???????????????????
? ?
'__inference_conv1d_1_layer_call_fn_5845k$%=?:
3?0
.?+
inputs???????????????????
? "&?#????????????????????
B__inference_conv1d_2_layer_call_and_return_conditional_losses_5862x&'=?:
3?0
.?+
inputs???????????????????
? "3?0
)?&
0???????????????????
? ?
'__inference_conv1d_2_layer_call_fn_5872k&'=?:
3?0
.?+
inputs???????????????????
? "&?#????????????????????
@__inference_conv1d_layer_call_and_return_conditional_losses_5808x"#=?:
3?0
.?+
inputs???????????????????
? "3?0
)?&
0???????????????????
? ?
%__inference_conv1d_layer_call_fn_5818k"#=?:
3?0
.?+
inputs???????????????????
? "&?#????????????????????
?__inference_dense_layer_call_and_return_conditional_losses_6077]0?-
&?#
!?
inputs??????????
? "%?"
?
0?????????
? x
$__inference_dense_layer_call_fn_6086P0?-
&?#
!?
inputs??????????
? "???????????
C__inference_embedding_layer_call_and_return_conditional_losses_6059b0?-
&?#
!?
inputs??????????'
? "+?(
!?
0??????????'?
? ?
(__inference_embedding_layer_call_fn_6066U0?-
&?#
!?
inputs??????????'
? "???????????'??
P__inference_global_max_pooling1d_1_layer_call_and_return_conditional_losses_5892wE?B
;?8
6?3
inputs'???????????????????????????
? ".?+
$?!
0??????????????????
? ?
5__inference_global_max_pooling1d_1_layer_call_fn_5898jE?B
;?8
6?3
inputs'???????????????????????????
? "!????????????????????
P__inference_global_max_pooling1d_2_layer_call_and_return_conditional_losses_5905wE?B
;?8
6?3
inputs'???????????????????????????
? ".?+
$?!
0??????????????????
? ?
5__inference_global_max_pooling1d_2_layer_call_fn_5911jE?B
;?8
6?3
inputs'???????????????????????????
? "!????????????????????
N__inference_global_max_pooling1d_layer_call_and_return_conditional_losses_5879wE?B
;?8
6?3
inputs'???????????????????????????
? ".?+
$?!
0??????????????????
? ?
3__inference_global_max_pooling1d_layer_call_fn_5885jE?B
;?8
6?3
inputs'???????????????????????????
? "!????????????????????
"__inference_signature_wrapper_6050~	"#$%&'<?9
? 
2?/
-
input_1"?
input_1??????????'"3?0
.
output_1"?
output_1??????????
B__inference_text_cnn_layer_call_and_return_conditional_losses_5993e	"#$%&'1?.
'?$
"?
input_1??????????'
? "%?"
?
0?????????
? ?
'__inference_text_cnn_layer_call_fn_6017X	"#$%&'1?.
'?$
"?
input_1??????????'
? "??????????