Ы┘
┘«
B
AssignVariableOp
resource
value"dtype"
dtypetypeѕ
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
Џ
Conv2D

input"T
filter"T
output"T"
Ttype:	
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
Г
GatherV2
params"Tparams
indices"Tindices
axis"Taxis
output"Tparams"

batch_dimsint "
Tparamstype"
Tindicestype:
2	"
Taxistype:
2	
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
ї
Max

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(ѕ

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetypeѕ
E
Relu
features"T
activations"T"
Ttype:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0ѕ
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0ѕ
?
Select
	condition

t"T
e"T
output"T"	
Ttype
H
ShardedFilename
basename	
shard

num_shards
filename
9
Softmax
logits"T
softmax"T"
Ttype:
2
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
Й
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
executor_typestring ѕ
@
StaticRegexFullMatch	
input

output
"
patternstring
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
ќ
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 ѕ"serve*2.4.12v2.4.0-49-g85c8b2a817f8┬§
ў
text_cnn/embedding/embeddingsVarHandleOp*
_output_shapes
: *
dtype0*
shape:
└>г*.
shared_nametext_cnn/embedding/embeddings
Љ
1text_cnn/embedding/embeddings/Read/ReadVariableOpReadVariableOptext_cnn/embedding/embeddings* 
_output_shapes
:
└>г*
dtype0
Є
text_cnn/dense/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	ђ*&
shared_nametext_cnn/dense/kernel
ђ
)text_cnn/dense/kernel/Read/ReadVariableOpReadVariableOptext_cnn/dense/kernel*
_output_shapes
:	ђ*
dtype0
~
text_cnn/dense/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_nametext_cnn/dense/bias
w
'text_cnn/dense/bias/Read/ReadVariableOpReadVariableOptext_cnn/dense/bias*
_output_shapes
:*
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
ј
text_cnn/conv1d/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:гђ*'
shared_nametext_cnn/conv1d/kernel
Є
*text_cnn/conv1d/kernel/Read/ReadVariableOpReadVariableOptext_cnn/conv1d/kernel*$
_output_shapes
:гђ*
dtype0
Ђ
text_cnn/conv1d/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*%
shared_nametext_cnn/conv1d/bias
z
(text_cnn/conv1d/bias/Read/ReadVariableOpReadVariableOptext_cnn/conv1d/bias*
_output_shapes	
:ђ*
dtype0
њ
text_cnn/conv1d_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:гђ*)
shared_nametext_cnn/conv1d_1/kernel
І
,text_cnn/conv1d_1/kernel/Read/ReadVariableOpReadVariableOptext_cnn/conv1d_1/kernel*$
_output_shapes
:гђ*
dtype0
Ё
text_cnn/conv1d_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*'
shared_nametext_cnn/conv1d_1/bias
~
*text_cnn/conv1d_1/bias/Read/ReadVariableOpReadVariableOptext_cnn/conv1d_1/bias*
_output_shapes	
:ђ*
dtype0
њ
text_cnn/conv1d_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:гђ*)
shared_nametext_cnn/conv1d_2/kernel
І
,text_cnn/conv1d_2/kernel/Read/ReadVariableOpReadVariableOptext_cnn/conv1d_2/kernel*$
_output_shapes
:гђ*
dtype0
Ё
text_cnn/conv1d_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*'
shared_nametext_cnn/conv1d_2/bias
~
*text_cnn/conv1d_2/bias/Read/ReadVariableOpReadVariableOptext_cnn/conv1d_2/bias*
_output_shapes	
:ђ*
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
д
$Adam/text_cnn/embedding/embeddings/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:
└>г*5
shared_name&$Adam/text_cnn/embedding/embeddings/m
Ъ
8Adam/text_cnn/embedding/embeddings/m/Read/ReadVariableOpReadVariableOp$Adam/text_cnn/embedding/embeddings/m* 
_output_shapes
:
└>г*
dtype0
Ћ
Adam/text_cnn/dense/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	ђ*-
shared_nameAdam/text_cnn/dense/kernel/m
ј
0Adam/text_cnn/dense/kernel/m/Read/ReadVariableOpReadVariableOpAdam/text_cnn/dense/kernel/m*
_output_shapes
:	ђ*
dtype0
ї
Adam/text_cnn/dense/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*+
shared_nameAdam/text_cnn/dense/bias/m
Ё
.Adam/text_cnn/dense/bias/m/Read/ReadVariableOpReadVariableOpAdam/text_cnn/dense/bias/m*
_output_shapes
:*
dtype0
ю
Adam/text_cnn/conv1d/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:гђ*.
shared_nameAdam/text_cnn/conv1d/kernel/m
Ћ
1Adam/text_cnn/conv1d/kernel/m/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d/kernel/m*$
_output_shapes
:гђ*
dtype0
Ј
Adam/text_cnn/conv1d/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*,
shared_nameAdam/text_cnn/conv1d/bias/m
ѕ
/Adam/text_cnn/conv1d/bias/m/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d/bias/m*
_output_shapes	
:ђ*
dtype0
а
Adam/text_cnn/conv1d_1/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:гђ*0
shared_name!Adam/text_cnn/conv1d_1/kernel/m
Ў
3Adam/text_cnn/conv1d_1/kernel/m/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d_1/kernel/m*$
_output_shapes
:гђ*
dtype0
Њ
Adam/text_cnn/conv1d_1/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*.
shared_nameAdam/text_cnn/conv1d_1/bias/m
ї
1Adam/text_cnn/conv1d_1/bias/m/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d_1/bias/m*
_output_shapes	
:ђ*
dtype0
а
Adam/text_cnn/conv1d_2/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:гђ*0
shared_name!Adam/text_cnn/conv1d_2/kernel/m
Ў
3Adam/text_cnn/conv1d_2/kernel/m/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d_2/kernel/m*$
_output_shapes
:гђ*
dtype0
Њ
Adam/text_cnn/conv1d_2/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*.
shared_nameAdam/text_cnn/conv1d_2/bias/m
ї
1Adam/text_cnn/conv1d_2/bias/m/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d_2/bias/m*
_output_shapes	
:ђ*
dtype0
д
$Adam/text_cnn/embedding/embeddings/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:
└>г*5
shared_name&$Adam/text_cnn/embedding/embeddings/v
Ъ
8Adam/text_cnn/embedding/embeddings/v/Read/ReadVariableOpReadVariableOp$Adam/text_cnn/embedding/embeddings/v* 
_output_shapes
:
└>г*
dtype0
Ћ
Adam/text_cnn/dense/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	ђ*-
shared_nameAdam/text_cnn/dense/kernel/v
ј
0Adam/text_cnn/dense/kernel/v/Read/ReadVariableOpReadVariableOpAdam/text_cnn/dense/kernel/v*
_output_shapes
:	ђ*
dtype0
ї
Adam/text_cnn/dense/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*+
shared_nameAdam/text_cnn/dense/bias/v
Ё
.Adam/text_cnn/dense/bias/v/Read/ReadVariableOpReadVariableOpAdam/text_cnn/dense/bias/v*
_output_shapes
:*
dtype0
ю
Adam/text_cnn/conv1d/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:гђ*.
shared_nameAdam/text_cnn/conv1d/kernel/v
Ћ
1Adam/text_cnn/conv1d/kernel/v/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d/kernel/v*$
_output_shapes
:гђ*
dtype0
Ј
Adam/text_cnn/conv1d/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*,
shared_nameAdam/text_cnn/conv1d/bias/v
ѕ
/Adam/text_cnn/conv1d/bias/v/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d/bias/v*
_output_shapes	
:ђ*
dtype0
а
Adam/text_cnn/conv1d_1/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:гђ*0
shared_name!Adam/text_cnn/conv1d_1/kernel/v
Ў
3Adam/text_cnn/conv1d_1/kernel/v/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d_1/kernel/v*$
_output_shapes
:гђ*
dtype0
Њ
Adam/text_cnn/conv1d_1/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*.
shared_nameAdam/text_cnn/conv1d_1/bias/v
ї
1Adam/text_cnn/conv1d_1/bias/v/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d_1/bias/v*
_output_shapes	
:ђ*
dtype0
а
Adam/text_cnn/conv1d_2/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:гђ*0
shared_name!Adam/text_cnn/conv1d_2/kernel/v
Ў
3Adam/text_cnn/conv1d_2/kernel/v/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d_2/kernel/v*$
_output_shapes
:гђ*
dtype0
Њ
Adam/text_cnn/conv1d_2/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*.
shared_nameAdam/text_cnn/conv1d_2/bias/v
ї
1Adam/text_cnn/conv1d_2/bias/v/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d_2/bias/v*
_output_shapes	
:ђ*
dtype0

NoOpNoOp
▓:
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*ь9
valueс9BЯ9 B┘9
┐
kernel_sizes
	embedding
	convs
max_poolings

classifier
	optimizer
trainable_variables
	variables
	regularization_losses

	keras_api

signatures
 
b

embeddings
trainable_variables
	variables
regularization_losses
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
trainable_variables
	variables
regularization_losses
	keras_api
В
iter

beta_1

beta_2
	 decay
!learning_ratemxmymz"m{#m|$m}%m~&m'mђvЂvѓvЃ"vё#vЁ$vє%vЄ&vѕ'vЅ
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
Г
(non_trainable_variables
)layer_metrics
trainable_variables
*metrics

+layers
	variables
	regularization_losses
,layer_regularization_losses
 
b`
VARIABLE_VALUEtext_cnn/embedding/embeddings/embedding/embeddings/.ATTRIBUTES/VARIABLE_VALUE

0

0
 
Г
-non_trainable_variables
.layer_metrics
trainable_variables

/layers
	variables
0metrics
regularization_losses
1layer_regularization_losses
h

"kernel
#bias
2trainable_variables
3	variables
4regularization_losses
5	keras_api
h

$kernel
%bias
6trainable_variables
7	variables
8regularization_losses
9	keras_api
h

&kernel
'bias
:trainable_variables
;	variables
<regularization_losses
=	keras_api
R
>trainable_variables
?	variables
@regularization_losses
A	keras_api
R
Btrainable_variables
C	variables
Dregularization_losses
E	keras_api
R
Ftrainable_variables
G	variables
Hregularization_losses
I	keras_api
WU
VARIABLE_VALUEtext_cnn/dense/kernel,classifier/kernel/.ATTRIBUTES/VARIABLE_VALUE
SQ
VARIABLE_VALUEtext_cnn/dense/bias*classifier/bias/.ATTRIBUTES/VARIABLE_VALUE

0
1

0
1
 
Г
Jnon_trainable_variables
Klayer_metrics
trainable_variables

Llayers
	variables
Mmetrics
regularization_losses
Nlayer_regularization_losses
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
\Z
VARIABLE_VALUEtext_cnn/conv1d/kernel0trainable_variables/1/.ATTRIBUTES/VARIABLE_VALUE
ZX
VARIABLE_VALUEtext_cnn/conv1d/bias0trainable_variables/2/.ATTRIBUTES/VARIABLE_VALUE
^\
VARIABLE_VALUEtext_cnn/conv1d_1/kernel0trainable_variables/3/.ATTRIBUTES/VARIABLE_VALUE
\Z
VARIABLE_VALUEtext_cnn/conv1d_1/bias0trainable_variables/4/.ATTRIBUTES/VARIABLE_VALUE
^\
VARIABLE_VALUEtext_cnn/conv1d_2/kernel0trainable_variables/5/.ATTRIBUTES/VARIABLE_VALUE
\Z
VARIABLE_VALUEtext_cnn/conv1d_2/bias0trainable_variables/6/.ATTRIBUTES/VARIABLE_VALUE
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
 

"0
#1

"0
#1
 
Г
Qnon_trainable_variables
Rlayer_metrics
2trainable_variables

Slayers
3	variables
Tmetrics
4regularization_losses
Ulayer_regularization_losses

$0
%1

$0
%1
 
Г
Vnon_trainable_variables
Wlayer_metrics
6trainable_variables

Xlayers
7	variables
Ymetrics
8regularization_losses
Zlayer_regularization_losses

&0
'1

&0
'1
 
Г
[non_trainable_variables
\layer_metrics
:trainable_variables

]layers
;	variables
^metrics
<regularization_losses
_layer_regularization_losses
 
 
 
Г
`non_trainable_variables
alayer_metrics
>trainable_variables

blayers
?	variables
cmetrics
@regularization_losses
dlayer_regularization_losses
 
 
 
Г
enon_trainable_variables
flayer_metrics
Btrainable_variables

glayers
C	variables
hmetrics
Dregularization_losses
ilayer_regularization_losses
 
 
 
Г
jnon_trainable_variables
klayer_metrics
Ftrainable_variables

llayers
G	variables
mmetrics
Hregularization_losses
nlayer_regularization_losses
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
єЃ
VARIABLE_VALUE$Adam/text_cnn/embedding/embeddings/mKembedding/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/text_cnn/dense/kernel/mHclassifier/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
vt
VARIABLE_VALUEAdam/text_cnn/dense/bias/mFclassifier/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
}
VARIABLE_VALUEAdam/text_cnn/conv1d/kernel/mLtrainable_variables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUEAdam/text_cnn/conv1d/bias/mLtrainable_variables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
Ђ
VARIABLE_VALUEAdam/text_cnn/conv1d_1/kernel/mLtrainable_variables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
}
VARIABLE_VALUEAdam/text_cnn/conv1d_1/bias/mLtrainable_variables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
Ђ
VARIABLE_VALUEAdam/text_cnn/conv1d_2/kernel/mLtrainable_variables/5/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
}
VARIABLE_VALUEAdam/text_cnn/conv1d_2/bias/mLtrainable_variables/6/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
єЃ
VARIABLE_VALUE$Adam/text_cnn/embedding/embeddings/vKembedding/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/text_cnn/dense/kernel/vHclassifier/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
vt
VARIABLE_VALUEAdam/text_cnn/dense/bias/vFclassifier/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
}
VARIABLE_VALUEAdam/text_cnn/conv1d/kernel/vLtrainable_variables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUEAdam/text_cnn/conv1d/bias/vLtrainable_variables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
Ђ
VARIABLE_VALUEAdam/text_cnn/conv1d_1/kernel/vLtrainable_variables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
}
VARIABLE_VALUEAdam/text_cnn/conv1d_1/bias/vLtrainable_variables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
Ђ
VARIABLE_VALUEAdam/text_cnn/conv1d_2/kernel/vLtrainable_variables/5/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
}
VARIABLE_VALUEAdam/text_cnn/conv1d_2/bias/vLtrainable_variables/6/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
~
serving_default_input_1Placeholder*)
_output_shapes
:         аю*
dtype0*
shape:         аю
Ъ
StatefulPartitionedCallStatefulPartitionedCallserving_default_input_1text_cnn/embedding/embeddingstext_cnn/conv1d/kerneltext_cnn/conv1d/biastext_cnn/conv1d_1/kerneltext_cnn/conv1d_1/biastext_cnn/conv1d_2/kerneltext_cnn/conv1d_2/biastext_cnn/dense/kerneltext_cnn/dense/bias*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *+
_read_only_resource_inputs
		*-
config_proto

CPU

GPU 2J 8ѓ *+
f&R$
"__inference_signature_wrapper_3741
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
Є
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename1text_cnn/embedding/embeddings/Read/ReadVariableOp)text_cnn/dense/kernel/Read/ReadVariableOp'text_cnn/dense/bias/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOp*text_cnn/conv1d/kernel/Read/ReadVariableOp(text_cnn/conv1d/bias/Read/ReadVariableOp,text_cnn/conv1d_1/kernel/Read/ReadVariableOp*text_cnn/conv1d_1/bias/Read/ReadVariableOp,text_cnn/conv1d_2/kernel/Read/ReadVariableOp*text_cnn/conv1d_2/bias/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOptotal_1/Read/ReadVariableOpcount_1/Read/ReadVariableOp8Adam/text_cnn/embedding/embeddings/m/Read/ReadVariableOp0Adam/text_cnn/dense/kernel/m/Read/ReadVariableOp.Adam/text_cnn/dense/bias/m/Read/ReadVariableOp1Adam/text_cnn/conv1d/kernel/m/Read/ReadVariableOp/Adam/text_cnn/conv1d/bias/m/Read/ReadVariableOp3Adam/text_cnn/conv1d_1/kernel/m/Read/ReadVariableOp1Adam/text_cnn/conv1d_1/bias/m/Read/ReadVariableOp3Adam/text_cnn/conv1d_2/kernel/m/Read/ReadVariableOp1Adam/text_cnn/conv1d_2/bias/m/Read/ReadVariableOp8Adam/text_cnn/embedding/embeddings/v/Read/ReadVariableOp0Adam/text_cnn/dense/kernel/v/Read/ReadVariableOp.Adam/text_cnn/dense/bias/v/Read/ReadVariableOp1Adam/text_cnn/conv1d/kernel/v/Read/ReadVariableOp/Adam/text_cnn/conv1d/bias/v/Read/ReadVariableOp3Adam/text_cnn/conv1d_1/kernel/v/Read/ReadVariableOp1Adam/text_cnn/conv1d_1/bias/v/Read/ReadVariableOp3Adam/text_cnn/conv1d_2/kernel/v/Read/ReadVariableOp1Adam/text_cnn/conv1d_2/bias/v/Read/ReadVariableOpConst*1
Tin*
(2&	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8ѓ *&
f!R
__inference__traced_save_3983
▓	
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenametext_cnn/embedding/embeddingstext_cnn/dense/kerneltext_cnn/dense/bias	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetext_cnn/conv1d/kerneltext_cnn/conv1d/biastext_cnn/conv1d_1/kerneltext_cnn/conv1d_1/biastext_cnn/conv1d_2/kerneltext_cnn/conv1d_2/biastotalcounttotal_1count_1$Adam/text_cnn/embedding/embeddings/mAdam/text_cnn/dense/kernel/mAdam/text_cnn/dense/bias/mAdam/text_cnn/conv1d/kernel/mAdam/text_cnn/conv1d/bias/mAdam/text_cnn/conv1d_1/kernel/mAdam/text_cnn/conv1d_1/bias/mAdam/text_cnn/conv1d_2/kernel/mAdam/text_cnn/conv1d_2/bias/m$Adam/text_cnn/embedding/embeddings/vAdam/text_cnn/dense/kernel/vAdam/text_cnn/dense/bias/vAdam/text_cnn/conv1d/kernel/vAdam/text_cnn/conv1d/bias/vAdam/text_cnn/conv1d_1/kernel/vAdam/text_cnn/conv1d_1/bias/vAdam/text_cnn/conv1d_2/kernel/vAdam/text_cnn/conv1d_2/bias/v*0
Tin)
'2%*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8ѓ *)
f$R"
 __inference__traced_restore_4101хп
ў
р
"__inference_signature_wrapper_3741
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
identityѕбStatefulPartitionedCallФ
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *+
_read_only_resource_inputs
		*-
config_proto

CPU

GPU 2J 8ѓ *(
f#R!
__inference__wrapped_model_34912
StatefulPartitionedCallј
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*L
_input_shapes;
9:         аю:::::::::22
StatefulPartitionedCallStatefulPartitionedCall:R N
)
_output_shapes
:         аю
!
_user_specified_name	input_1
У
Q
5__inference_global_max_pooling1d_1_layer_call_fn_3517

inputs
identityО
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:                  * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8ѓ *Y
fTRR
P__inference_global_max_pooling1d_1_layer_call_and_return_conditional_losses_35112
PartitionedCallu
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:                  2

Identity"
identityIdentity:output:0*<
_input_shapes+
):'                           :e a
=
_output_shapes+
):'                           
 
_user_specified_nameinputs
н
y
$__inference_dense_layer_call_fn_3777

inputs
unknown
	unknown_0
identityѕбStatefulPartitionedCall№
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8ѓ *H
fCRA
?__inference_dense_layer_call_and_return_conditional_losses_36672
StatefulPartitionedCallј
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*/
_input_shapes
:         ђ::22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
╗'
»
B__inference_text_cnn_layer_call_and_return_conditional_losses_3684
input_1
embedding_3552
conv1d_3582
conv1d_3584
conv1d_1_3615
conv1d_1_3617
conv1d_2_3648
conv1d_2_3650

dense_3678

dense_3680
identityѕбconv1d/StatefulPartitionedCallб conv1d_1/StatefulPartitionedCallб conv1d_2/StatefulPartitionedCallбdense/StatefulPartitionedCallб!embedding/StatefulPartitionedCallЅ
!embedding/StatefulPartitionedCallStatefulPartitionedCallinput_1embedding_3552*
Tin
2*
Tout
2*
_collective_manager_ids
 *.
_output_shapes
:         аюг*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8ѓ *L
fGRE
C__inference_embedding_layer_call_and_return_conditional_losses_35432#
!embedding/StatefulPartitionedCall»
conv1d/StatefulPartitionedCallStatefulPartitionedCall*embedding/StatefulPartitionedCall:output:0conv1d_3582conv1d_3584*
Tin
2*
Tout
2*
_collective_manager_ids
 *.
_output_shapes
:         ъюђ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8ѓ *I
fDRB
@__inference_conv1d_layer_call_and_return_conditional_losses_35712 
conv1d/StatefulPartitionedCallў
$global_max_pooling1d/PartitionedCallPartitionedCall'conv1d/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8ѓ *W
fRRP
N__inference_global_max_pooling1d_layer_call_and_return_conditional_losses_34982&
$global_max_pooling1d/PartitionedCall╣
 conv1d_1/StatefulPartitionedCallStatefulPartitionedCall*embedding/StatefulPartitionedCall:output:0conv1d_1_3615conv1d_1_3617*
Tin
2*
Tout
2*
_collective_manager_ids
 *.
_output_shapes
:         Ююђ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8ѓ *K
fFRD
B__inference_conv1d_1_layer_call_and_return_conditional_losses_36042"
 conv1d_1/StatefulPartitionedCallа
&global_max_pooling1d_1/PartitionedCallPartitionedCall)conv1d_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8ѓ *Y
fTRR
P__inference_global_max_pooling1d_1_layer_call_and_return_conditional_losses_35112(
&global_max_pooling1d_1/PartitionedCall╣
 conv1d_2/StatefulPartitionedCallStatefulPartitionedCall*embedding/StatefulPartitionedCall:output:0conv1d_2_3648conv1d_2_3650*
Tin
2*
Tout
2*
_collective_manager_ids
 *.
_output_shapes
:         ююђ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8ѓ *K
fFRD
B__inference_conv1d_2_layer_call_and_return_conditional_losses_36372"
 conv1d_2/StatefulPartitionedCallа
&global_max_pooling1d_2/PartitionedCallPartitionedCall)conv1d_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8ѓ *Y
fTRR
P__inference_global_max_pooling1d_2_layer_call_and_return_conditional_losses_35242(
&global_max_pooling1d_2/PartitionedCallt
concatenate/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concatenate/concat/axisБ
concatenate/concatConcatV2-global_max_pooling1d/PartitionedCall:output:0/global_max_pooling1d_1/PartitionedCall:output:0/global_max_pooling1d_2/PartitionedCall:output:0 concatenate/concat/axis:output:0*
N*
T0*(
_output_shapes
:         ђ2
concatenate/concatћ
dense/StatefulPartitionedCallStatefulPartitionedCallconcatenate/concat:output:0
dense_3678
dense_3680*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8ѓ *H
fCRA
?__inference_dense_layer_call_and_return_conditional_losses_36672
dense/StatefulPartitionedCallЦ
IdentityIdentity&dense/StatefulPartitionedCall:output:0^conv1d/StatefulPartitionedCall!^conv1d_1/StatefulPartitionedCall!^conv1d_2/StatefulPartitionedCall^dense/StatefulPartitionedCall"^embedding/StatefulPartitionedCall*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*L
_input_shapes;
9:         аю:::::::::2@
conv1d/StatefulPartitionedCallconv1d/StatefulPartitionedCall2D
 conv1d_1/StatefulPartitionedCall conv1d_1/StatefulPartitionedCall2D
 conv1d_2/StatefulPartitionedCall conv1d_2/StatefulPartitionedCall2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2F
!embedding/StatefulPartitionedCall!embedding/StatefulPartitionedCall:R N
)
_output_shapes
:         аю
!
_user_specified_name	input_1
└
Т
'__inference_text_cnn_layer_call_fn_3708
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
identityѕбStatefulPartitionedCall╬
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *+
_read_only_resource_inputs
		*-
config_proto

CPU

GPU 2J 8ѓ *K
fFRD
B__inference_text_cnn_layer_call_and_return_conditional_losses_36842
StatefulPartitionedCallј
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*L
_input_shapes;
9:         аю:::::::::22
StatefulPartitionedCallStatefulPartitionedCall:R N
)
_output_shapes
:         аю
!
_user_specified_name	input_1
«
ш
B__inference_conv1d_1_layer_call_and_return_conditional_losses_3818

inputs/
+conv1d_expanddims_1_readvariableop_resource#
biasadd_readvariableop_resource
identityѕбBiasAdd/ReadVariableOpб"conv1d/ExpandDims_1/ReadVariableOpy
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
§        2
conv1d/ExpandDims/dimЎ
conv1d/ExpandDims
ExpandDimsinputsconv1d/ExpandDims/dim:output:0*
T0*2
_output_shapes 
:         аюг2
conv1d/ExpandDims║
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*$
_output_shapes
:гђ*
dtype02$
"conv1d/ExpandDims_1/ReadVariableOpt
conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/ExpandDims_1/dim╣
conv1d/ExpandDims_1
ExpandDims*conv1d/ExpandDims_1/ReadVariableOp:value:0 conv1d/ExpandDims_1/dim:output:0*
T0*(
_output_shapes
:гђ2
conv1d/ExpandDims_1║
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*2
_output_shapes 
:         Ююђ*
paddingVALID*
strides
2
conv1dЋ
conv1d/SqueezeSqueezeconv1d:output:0*
T0*.
_output_shapes
:         Ююђ*
squeeze_dims

§        2
conv1d/SqueezeЇ
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
BiasAdd/ReadVariableOpЈ
BiasAddBiasAddconv1d/Squeeze:output:0BiasAdd/ReadVariableOp:value:0*
T0*.
_output_shapes
:         Ююђ2	
BiasAdd_
ReluReluBiasAdd:output:0*
T0*.
_output_shapes
:         Ююђ2
ReluФ
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp#^conv1d/ExpandDims_1/ReadVariableOp*
T0*.
_output_shapes
:         Ююђ2

Identity"
identityIdentity:output:0*5
_input_shapes$
":         аюг::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2H
"conv1d/ExpandDims_1/ReadVariableOp"conv1d/ExpandDims_1/ReadVariableOp:V R
.
_output_shapes
:         аюг
 
_user_specified_nameinputs
хџ
А
 __inference__traced_restore_4101
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
identity_37ѕбAssignVariableOpбAssignVariableOp_1бAssignVariableOp_10бAssignVariableOp_11бAssignVariableOp_12бAssignVariableOp_13бAssignVariableOp_14бAssignVariableOp_15бAssignVariableOp_16бAssignVariableOp_17бAssignVariableOp_18бAssignVariableOp_19бAssignVariableOp_2бAssignVariableOp_20бAssignVariableOp_21бAssignVariableOp_22бAssignVariableOp_23бAssignVariableOp_24бAssignVariableOp_25бAssignVariableOp_26бAssignVariableOp_27бAssignVariableOp_28бAssignVariableOp_29бAssignVariableOp_3бAssignVariableOp_30бAssignVariableOp_31бAssignVariableOp_32бAssignVariableOp_33бAssignVariableOp_34бAssignVariableOp_35бAssignVariableOp_4бAssignVariableOp_5бAssignVariableOp_6бAssignVariableOp_7бAssignVariableOp_8бAssignVariableOp_9Ђ
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:%*
dtype0*Ї
valueЃBђ%B/embedding/embeddings/.ATTRIBUTES/VARIABLE_VALUEB,classifier/kernel/.ATTRIBUTES/VARIABLE_VALUEB*classifier/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB0trainable_variables/1/.ATTRIBUTES/VARIABLE_VALUEB0trainable_variables/2/.ATTRIBUTES/VARIABLE_VALUEB0trainable_variables/3/.ATTRIBUTES/VARIABLE_VALUEB0trainable_variables/4/.ATTRIBUTES/VARIABLE_VALUEB0trainable_variables/5/.ATTRIBUTES/VARIABLE_VALUEB0trainable_variables/6/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBKembedding/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBHclassifier/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBFclassifier/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/5/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/6/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBKembedding/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBHclassifier/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBFclassifier/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/5/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/6/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
RestoreV2/tensor_namesп
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:%*
dtype0*]
valueTBR%B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 2
RestoreV2/shape_and_slicesу
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*ф
_output_shapesЌ
ћ:::::::::::::::::::::::::::::::::::::*3
dtypes)
'2%	2
	RestoreV2g
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:2

IdentityГ
AssignVariableOpAssignVariableOp.assignvariableop_text_cnn_embedding_embeddingsIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOpk

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:2

Identity_1Г
AssignVariableOp_1AssignVariableOp(assignvariableop_1_text_cnn_dense_kernelIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_1k

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:2

Identity_2Ф
AssignVariableOp_2AssignVariableOp&assignvariableop_2_text_cnn_dense_biasIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_2k

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0	*
_output_shapes
:2

Identity_3А
AssignVariableOp_3AssignVariableOpassignvariableop_3_adam_iterIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	2
AssignVariableOp_3k

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:2

Identity_4Б
AssignVariableOp_4AssignVariableOpassignvariableop_4_adam_beta_1Identity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_4k

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:2

Identity_5Б
AssignVariableOp_5AssignVariableOpassignvariableop_5_adam_beta_2Identity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_5k

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:2

Identity_6б
AssignVariableOp_6AssignVariableOpassignvariableop_6_adam_decayIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_6k

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:2

Identity_7ф
AssignVariableOp_7AssignVariableOp%assignvariableop_7_adam_learning_rateIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_7k

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:2

Identity_8«
AssignVariableOp_8AssignVariableOp)assignvariableop_8_text_cnn_conv1d_kernelIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_8k

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:2

Identity_9г
AssignVariableOp_9AssignVariableOp'assignvariableop_9_text_cnn_conv1d_biasIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_9n
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:2
Identity_10┤
AssignVariableOp_10AssignVariableOp,assignvariableop_10_text_cnn_conv1d_1_kernelIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_10n
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:2
Identity_11▓
AssignVariableOp_11AssignVariableOp*assignvariableop_11_text_cnn_conv1d_1_biasIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_11n
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:2
Identity_12┤
AssignVariableOp_12AssignVariableOp,assignvariableop_12_text_cnn_conv1d_2_kernelIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_12n
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:2
Identity_13▓
AssignVariableOp_13AssignVariableOp*assignvariableop_13_text_cnn_conv1d_2_biasIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_13n
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:2
Identity_14А
AssignVariableOp_14AssignVariableOpassignvariableop_14_totalIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_14n
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:2
Identity_15А
AssignVariableOp_15AssignVariableOpassignvariableop_15_countIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_15n
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:2
Identity_16Б
AssignVariableOp_16AssignVariableOpassignvariableop_16_total_1Identity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_16n
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:2
Identity_17Б
AssignVariableOp_17AssignVariableOpassignvariableop_17_count_1Identity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_17n
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:2
Identity_18└
AssignVariableOp_18AssignVariableOp8assignvariableop_18_adam_text_cnn_embedding_embeddings_mIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_18n
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:2
Identity_19И
AssignVariableOp_19AssignVariableOp0assignvariableop_19_adam_text_cnn_dense_kernel_mIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_19n
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:2
Identity_20Х
AssignVariableOp_20AssignVariableOp.assignvariableop_20_adam_text_cnn_dense_bias_mIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_20n
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:2
Identity_21╣
AssignVariableOp_21AssignVariableOp1assignvariableop_21_adam_text_cnn_conv1d_kernel_mIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_21n
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:2
Identity_22и
AssignVariableOp_22AssignVariableOp/assignvariableop_22_adam_text_cnn_conv1d_bias_mIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_22n
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:2
Identity_23╗
AssignVariableOp_23AssignVariableOp3assignvariableop_23_adam_text_cnn_conv1d_1_kernel_mIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_23n
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:2
Identity_24╣
AssignVariableOp_24AssignVariableOp1assignvariableop_24_adam_text_cnn_conv1d_1_bias_mIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_24n
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:2
Identity_25╗
AssignVariableOp_25AssignVariableOp3assignvariableop_25_adam_text_cnn_conv1d_2_kernel_mIdentity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_25n
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:2
Identity_26╣
AssignVariableOp_26AssignVariableOp1assignvariableop_26_adam_text_cnn_conv1d_2_bias_mIdentity_26:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_26n
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:2
Identity_27└
AssignVariableOp_27AssignVariableOp8assignvariableop_27_adam_text_cnn_embedding_embeddings_vIdentity_27:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_27n
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
:2
Identity_28И
AssignVariableOp_28AssignVariableOp0assignvariableop_28_adam_text_cnn_dense_kernel_vIdentity_28:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_28n
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:2
Identity_29Х
AssignVariableOp_29AssignVariableOp.assignvariableop_29_adam_text_cnn_dense_bias_vIdentity_29:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_29n
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:2
Identity_30╣
AssignVariableOp_30AssignVariableOp1assignvariableop_30_adam_text_cnn_conv1d_kernel_vIdentity_30:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_30n
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0*
_output_shapes
:2
Identity_31и
AssignVariableOp_31AssignVariableOp/assignvariableop_31_adam_text_cnn_conv1d_bias_vIdentity_31:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_31n
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:2
Identity_32╗
AssignVariableOp_32AssignVariableOp3assignvariableop_32_adam_text_cnn_conv1d_1_kernel_vIdentity_32:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_32n
Identity_33IdentityRestoreV2:tensors:33"/device:CPU:0*
T0*
_output_shapes
:2
Identity_33╣
AssignVariableOp_33AssignVariableOp1assignvariableop_33_adam_text_cnn_conv1d_1_bias_vIdentity_33:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_33n
Identity_34IdentityRestoreV2:tensors:34"/device:CPU:0*
T0*
_output_shapes
:2
Identity_34╗
AssignVariableOp_34AssignVariableOp3assignvariableop_34_adam_text_cnn_conv1d_2_kernel_vIdentity_34:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_34n
Identity_35IdentityRestoreV2:tensors:35"/device:CPU:0*
T0*
_output_shapes
:2
Identity_35╣
AssignVariableOp_35AssignVariableOp1assignvariableop_35_adam_text_cnn_conv1d_2_bias_vIdentity_35:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_359
NoOpNoOp"/device:CPU:0*
_output_shapes
 2
NoOpШ
Identity_36Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: 2
Identity_36ж
Identity_37IdentityIdentity_36:output:0^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*
T0*
_output_shapes
: 2
Identity_37"#
identity_37Identity_37:output:0*Д
_input_shapesЋ
њ: ::::::::::::::::::::::::::::::::::::2$
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
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
З	
п
?__inference_dense_layer_call_and_return_conditional_losses_3667

inputs"
matmul_readvariableop_resource#
biasadd_readvariableop_resource
identityѕбBiasAdd/ReadVariableOpбMatMul/ReadVariableOpј
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ђ*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
MatMulї
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOpЂ
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2	
BiasAdda
SoftmaxSoftmaxBiasAdd:output:0*
T0*'
_output_shapes
:         2	
Softmaxќ
IdentityIdentitySoftmax:softmax:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*/
_input_shapes
:         ђ::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
┐

▓
C__inference_embedding_layer_call_and_return_conditional_losses_3543

inputs,
(embedding_lookup_readvariableop_resource
identityѕбembedding_lookup/ReadVariableOpГ
embedding_lookup/ReadVariableOpReadVariableOp(embedding_lookup_readvariableop_resource* 
_output_shapes
:
└>г*
dtype02!
embedding_lookup/ReadVariableOpц
embedding_lookup/axisConst*2
_class(
&$loc:@embedding_lookup/ReadVariableOp*
_output_shapes
: *
dtype0*
value	B : 2
embedding_lookup/axisЉ
embedding_lookupGatherV2'embedding_lookup/ReadVariableOp:value:0inputsembedding_lookup/axis:output:0*
Taxis0*
Tindices0*
Tparams0*2
_class(
&$loc:@embedding_lookup/ReadVariableOp*.
_output_shapes
:         аюг2
embedding_lookupќ
embedding_lookup/IdentityIdentityembedding_lookup:output:0*
T0*.
_output_shapes
:         аюг2
embedding_lookup/IdentityЪ
IdentityIdentity"embedding_lookup/Identity:output:0 ^embedding_lookup/ReadVariableOp*
T0*.
_output_shapes
:         аюг2

Identity"
identityIdentity:output:0*,
_input_shapes
:         аю:2B
embedding_lookup/ReadVariableOpembedding_lookup/ReadVariableOp:Q M
)
_output_shapes
:         аю
 
_user_specified_nameinputs
г
з
@__inference_conv1d_layer_call_and_return_conditional_losses_3793

inputs/
+conv1d_expanddims_1_readvariableop_resource#
biasadd_readvariableop_resource
identityѕбBiasAdd/ReadVariableOpб"conv1d/ExpandDims_1/ReadVariableOpy
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
§        2
conv1d/ExpandDims/dimЎ
conv1d/ExpandDims
ExpandDimsinputsconv1d/ExpandDims/dim:output:0*
T0*2
_output_shapes 
:         аюг2
conv1d/ExpandDims║
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*$
_output_shapes
:гђ*
dtype02$
"conv1d/ExpandDims_1/ReadVariableOpt
conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/ExpandDims_1/dim╣
conv1d/ExpandDims_1
ExpandDims*conv1d/ExpandDims_1/ReadVariableOp:value:0 conv1d/ExpandDims_1/dim:output:0*
T0*(
_output_shapes
:гђ2
conv1d/ExpandDims_1║
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*2
_output_shapes 
:         ъюђ*
paddingVALID*
strides
2
conv1dЋ
conv1d/SqueezeSqueezeconv1d:output:0*
T0*.
_output_shapes
:         ъюђ*
squeeze_dims

§        2
conv1d/SqueezeЇ
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
BiasAdd/ReadVariableOpЈ
BiasAddBiasAddconv1d/Squeeze:output:0BiasAdd/ReadVariableOp:value:0*
T0*.
_output_shapes
:         ъюђ2	
BiasAdd_
ReluReluBiasAdd:output:0*
T0*.
_output_shapes
:         ъюђ2
ReluФ
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp#^conv1d/ExpandDims_1/ReadVariableOp*
T0*.
_output_shapes
:         ъюђ2

Identity"
identityIdentity:output:0*5
_input_shapes$
":         аюг::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2H
"conv1d/ExpandDims_1/ReadVariableOp"conv1d/ExpandDims_1/ReadVariableOp:V R
.
_output_shapes
:         аюг
 
_user_specified_nameinputs
г
з
@__inference_conv1d_layer_call_and_return_conditional_losses_3571

inputs/
+conv1d_expanddims_1_readvariableop_resource#
biasadd_readvariableop_resource
identityѕбBiasAdd/ReadVariableOpб"conv1d/ExpandDims_1/ReadVariableOpy
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
§        2
conv1d/ExpandDims/dimЎ
conv1d/ExpandDims
ExpandDimsinputsconv1d/ExpandDims/dim:output:0*
T0*2
_output_shapes 
:         аюг2
conv1d/ExpandDims║
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*$
_output_shapes
:гђ*
dtype02$
"conv1d/ExpandDims_1/ReadVariableOpt
conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/ExpandDims_1/dim╣
conv1d/ExpandDims_1
ExpandDims*conv1d/ExpandDims_1/ReadVariableOp:value:0 conv1d/ExpandDims_1/dim:output:0*
T0*(
_output_shapes
:гђ2
conv1d/ExpandDims_1║
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*2
_output_shapes 
:         ъюђ*
paddingVALID*
strides
2
conv1dЋ
conv1d/SqueezeSqueezeconv1d:output:0*
T0*.
_output_shapes
:         ъюђ*
squeeze_dims

§        2
conv1d/SqueezeЇ
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
BiasAdd/ReadVariableOpЈ
BiasAddBiasAddconv1d/Squeeze:output:0BiasAdd/ReadVariableOp:value:0*
T0*.
_output_shapes
:         ъюђ2	
BiasAdd_
ReluReluBiasAdd:output:0*
T0*.
_output_shapes
:         ъюђ2
ReluФ
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp#^conv1d/ExpandDims_1/ReadVariableOp*
T0*.
_output_shapes
:         ъюђ2

Identity"
identityIdentity:output:0*5
_input_shapes$
":         аюг::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2H
"conv1d/ExpandDims_1/ReadVariableOp"conv1d/ExpandDims_1/ReadVariableOp:V R
.
_output_shapes
:         аюг
 
_user_specified_nameinputs
юP
└
__inference__traced_save_3983
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
8savev2_adam_text_cnn_conv1d_2_bias_v_read_readvariableop
savev2_const

identity_1ѕбMergeV2CheckpointsЈ
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
Constl
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part2	
Const_1І
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
value	B :2

num_shards
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 2
ShardedFilename/shardд
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: 2
ShardedFilenameч
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:%*
dtype0*Ї
valueЃBђ%B/embedding/embeddings/.ATTRIBUTES/VARIABLE_VALUEB,classifier/kernel/.ATTRIBUTES/VARIABLE_VALUEB*classifier/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB0trainable_variables/1/.ATTRIBUTES/VARIABLE_VALUEB0trainable_variables/2/.ATTRIBUTES/VARIABLE_VALUEB0trainable_variables/3/.ATTRIBUTES/VARIABLE_VALUEB0trainable_variables/4/.ATTRIBUTES/VARIABLE_VALUEB0trainable_variables/5/.ATTRIBUTES/VARIABLE_VALUEB0trainable_variables/6/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBKembedding/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBHclassifier/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBFclassifier/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/5/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/6/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBKembedding/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBHclassifier/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBFclassifier/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/5/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/6/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
SaveV2/tensor_namesм
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:%*
dtype0*]
valueTBR%B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 2
SaveV2/shape_and_slicesц
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:08savev2_text_cnn_embedding_embeddings_read_readvariableop0savev2_text_cnn_dense_kernel_read_readvariableop.savev2_text_cnn_dense_bias_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop1savev2_text_cnn_conv1d_kernel_read_readvariableop/savev2_text_cnn_conv1d_bias_read_readvariableop3savev2_text_cnn_conv1d_1_kernel_read_readvariableop1savev2_text_cnn_conv1d_1_bias_read_readvariableop3savev2_text_cnn_conv1d_2_kernel_read_readvariableop1savev2_text_cnn_conv1d_2_bias_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop"savev2_total_1_read_readvariableop"savev2_count_1_read_readvariableop?savev2_adam_text_cnn_embedding_embeddings_m_read_readvariableop7savev2_adam_text_cnn_dense_kernel_m_read_readvariableop5savev2_adam_text_cnn_dense_bias_m_read_readvariableop8savev2_adam_text_cnn_conv1d_kernel_m_read_readvariableop6savev2_adam_text_cnn_conv1d_bias_m_read_readvariableop:savev2_adam_text_cnn_conv1d_1_kernel_m_read_readvariableop8savev2_adam_text_cnn_conv1d_1_bias_m_read_readvariableop:savev2_adam_text_cnn_conv1d_2_kernel_m_read_readvariableop8savev2_adam_text_cnn_conv1d_2_bias_m_read_readvariableop?savev2_adam_text_cnn_embedding_embeddings_v_read_readvariableop7savev2_adam_text_cnn_dense_kernel_v_read_readvariableop5savev2_adam_text_cnn_dense_bias_v_read_readvariableop8savev2_adam_text_cnn_conv1d_kernel_v_read_readvariableop6savev2_adam_text_cnn_conv1d_bias_v_read_readvariableop:savev2_adam_text_cnn_conv1d_1_kernel_v_read_readvariableop8savev2_adam_text_cnn_conv1d_1_bias_v_read_readvariableop:savev2_adam_text_cnn_conv1d_2_kernel_v_read_readvariableop8savev2_adam_text_cnn_conv1d_2_bias_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *3
dtypes)
'2%	2
SaveV2║
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:2(
&MergeV2Checkpoints/checkpoint_prefixesА
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 2
MergeV2Checkpointsr
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: 2

Identitym

Identity_1IdentityIdentity:output:0^MergeV2Checkpoints*
T0*
_output_shapes
: 2

Identity_1"!

identity_1Identity_1:output:0*Л
_input_shapes┐
╝: :
└>г:	ђ:: : : : : :гђ:ђ:гђ:ђ:гђ:ђ: : : : :
└>г:	ђ::гђ:ђ:гђ:ђ:гђ:ђ:
└>г:	ђ::гђ:ђ:гђ:ђ:гђ:ђ: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:&"
 
_output_shapes
:
└>г:%!

_output_shapes
:	ђ: 

_output_shapes
::
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
:гђ:!


_output_shapes	
:ђ:*&
$
_output_shapes
:гђ:!

_output_shapes	
:ђ:*&
$
_output_shapes
:гђ:!

_output_shapes	
:ђ:
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
└>г:%!

_output_shapes
:	ђ: 

_output_shapes
::*&
$
_output_shapes
:гђ:!

_output_shapes	
:ђ:*&
$
_output_shapes
:гђ:!

_output_shapes	
:ђ:*&
$
_output_shapes
:гђ:!

_output_shapes	
:ђ:&"
 
_output_shapes
:
└>г:%!

_output_shapes
:	ђ: 

_output_shapes
::*&
$
_output_shapes
:гђ:! 

_output_shapes	
:ђ:*!&
$
_output_shapes
:гђ:!"

_output_shapes	
:ђ:*#&
$
_output_shapes
:гђ:!$

_output_shapes	
:ђ:%

_output_shapes
: 
лa
э
__inference__wrapped_model_3491
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
identityѕб&text_cnn/conv1d/BiasAdd/ReadVariableOpб2text_cnn/conv1d/conv1d/ExpandDims_1/ReadVariableOpб(text_cnn/conv1d_1/BiasAdd/ReadVariableOpб4text_cnn/conv1d_1/conv1d/ExpandDims_1/ReadVariableOpб(text_cnn/conv1d_2/BiasAdd/ReadVariableOpб4text_cnn/conv1d_2/conv1d/ExpandDims_1/ReadVariableOpб%text_cnn/dense/BiasAdd/ReadVariableOpб$text_cnn/dense/MatMul/ReadVariableOpб2text_cnn/embedding/embedding_lookup/ReadVariableOpТ
2text_cnn/embedding/embedding_lookup/ReadVariableOpReadVariableOp;text_cnn_embedding_embedding_lookup_readvariableop_resource* 
_output_shapes
:
└>г*
dtype024
2text_cnn/embedding/embedding_lookup/ReadVariableOpП
(text_cnn/embedding/embedding_lookup/axisConst*E
_class;
97loc:@text_cnn/embedding/embedding_lookup/ReadVariableOp*
_output_shapes
: *
dtype0*
value	B : 2*
(text_cnn/embedding/embedding_lookup/axisы
#text_cnn/embedding/embedding_lookupGatherV2:text_cnn/embedding/embedding_lookup/ReadVariableOp:value:0input_11text_cnn/embedding/embedding_lookup/axis:output:0*
Taxis0*
Tindices0*
Tparams0*E
_class;
97loc:@text_cnn/embedding/embedding_lookup/ReadVariableOp*.
_output_shapes
:         аюг2%
#text_cnn/embedding/embedding_lookup¤
,text_cnn/embedding/embedding_lookup/IdentityIdentity,text_cnn/embedding/embedding_lookup:output:0*
T0*.
_output_shapes
:         аюг2.
,text_cnn/embedding/embedding_lookup/IdentityЎ
%text_cnn/conv1d/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
§        2'
%text_cnn/conv1d/conv1d/ExpandDims/dimЭ
!text_cnn/conv1d/conv1d/ExpandDims
ExpandDims5text_cnn/embedding/embedding_lookup/Identity:output:0.text_cnn/conv1d/conv1d/ExpandDims/dim:output:0*
T0*2
_output_shapes 
:         аюг2#
!text_cnn/conv1d/conv1d/ExpandDimsЖ
2text_cnn/conv1d/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp;text_cnn_conv1d_conv1d_expanddims_1_readvariableop_resource*$
_output_shapes
:гђ*
dtype024
2text_cnn/conv1d/conv1d/ExpandDims_1/ReadVariableOpћ
'text_cnn/conv1d/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2)
'text_cnn/conv1d/conv1d/ExpandDims_1/dimщ
#text_cnn/conv1d/conv1d/ExpandDims_1
ExpandDims:text_cnn/conv1d/conv1d/ExpandDims_1/ReadVariableOp:value:00text_cnn/conv1d/conv1d/ExpandDims_1/dim:output:0*
T0*(
_output_shapes
:гђ2%
#text_cnn/conv1d/conv1d/ExpandDims_1Щ
text_cnn/conv1d/conv1dConv2D*text_cnn/conv1d/conv1d/ExpandDims:output:0,text_cnn/conv1d/conv1d/ExpandDims_1:output:0*
T0*2
_output_shapes 
:         ъюђ*
paddingVALID*
strides
2
text_cnn/conv1d/conv1d┼
text_cnn/conv1d/conv1d/SqueezeSqueezetext_cnn/conv1d/conv1d:output:0*
T0*.
_output_shapes
:         ъюђ*
squeeze_dims

§        2 
text_cnn/conv1d/conv1d/Squeezeй
&text_cnn/conv1d/BiasAdd/ReadVariableOpReadVariableOp/text_cnn_conv1d_biasadd_readvariableop_resource*
_output_shapes	
:ђ*
dtype02(
&text_cnn/conv1d/BiasAdd/ReadVariableOp¤
text_cnn/conv1d/BiasAddBiasAdd'text_cnn/conv1d/conv1d/Squeeze:output:0.text_cnn/conv1d/BiasAdd/ReadVariableOp:value:0*
T0*.
_output_shapes
:         ъюђ2
text_cnn/conv1d/BiasAddЈ
text_cnn/conv1d/ReluRelu text_cnn/conv1d/BiasAdd:output:0*
T0*.
_output_shapes
:         ъюђ2
text_cnn/conv1d/Reluг
3text_cnn/global_max_pooling1d/Max/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :25
3text_cnn/global_max_pooling1d/Max/reduction_indicesР
!text_cnn/global_max_pooling1d/MaxMax"text_cnn/conv1d/Relu:activations:0<text_cnn/global_max_pooling1d/Max/reduction_indices:output:0*
T0*(
_output_shapes
:         ђ2#
!text_cnn/global_max_pooling1d/MaxЮ
'text_cnn/conv1d_1/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
§        2)
'text_cnn/conv1d_1/conv1d/ExpandDims/dim■
#text_cnn/conv1d_1/conv1d/ExpandDims
ExpandDims5text_cnn/embedding/embedding_lookup/Identity:output:00text_cnn/conv1d_1/conv1d/ExpandDims/dim:output:0*
T0*2
_output_shapes 
:         аюг2%
#text_cnn/conv1d_1/conv1d/ExpandDims­
4text_cnn/conv1d_1/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp=text_cnn_conv1d_1_conv1d_expanddims_1_readvariableop_resource*$
_output_shapes
:гђ*
dtype026
4text_cnn/conv1d_1/conv1d/ExpandDims_1/ReadVariableOpў
)text_cnn/conv1d_1/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2+
)text_cnn/conv1d_1/conv1d/ExpandDims_1/dimЂ
%text_cnn/conv1d_1/conv1d/ExpandDims_1
ExpandDims<text_cnn/conv1d_1/conv1d/ExpandDims_1/ReadVariableOp:value:02text_cnn/conv1d_1/conv1d/ExpandDims_1/dim:output:0*
T0*(
_output_shapes
:гђ2'
%text_cnn/conv1d_1/conv1d/ExpandDims_1ѓ
text_cnn/conv1d_1/conv1dConv2D,text_cnn/conv1d_1/conv1d/ExpandDims:output:0.text_cnn/conv1d_1/conv1d/ExpandDims_1:output:0*
T0*2
_output_shapes 
:         Ююђ*
paddingVALID*
strides
2
text_cnn/conv1d_1/conv1d╦
 text_cnn/conv1d_1/conv1d/SqueezeSqueeze!text_cnn/conv1d_1/conv1d:output:0*
T0*.
_output_shapes
:         Ююђ*
squeeze_dims

§        2"
 text_cnn/conv1d_1/conv1d/Squeeze├
(text_cnn/conv1d_1/BiasAdd/ReadVariableOpReadVariableOp1text_cnn_conv1d_1_biasadd_readvariableop_resource*
_output_shapes	
:ђ*
dtype02*
(text_cnn/conv1d_1/BiasAdd/ReadVariableOpО
text_cnn/conv1d_1/BiasAddBiasAdd)text_cnn/conv1d_1/conv1d/Squeeze:output:00text_cnn/conv1d_1/BiasAdd/ReadVariableOp:value:0*
T0*.
_output_shapes
:         Ююђ2
text_cnn/conv1d_1/BiasAddЋ
text_cnn/conv1d_1/ReluRelu"text_cnn/conv1d_1/BiasAdd:output:0*
T0*.
_output_shapes
:         Ююђ2
text_cnn/conv1d_1/Relu░
5text_cnn/global_max_pooling1d_1/Max/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :27
5text_cnn/global_max_pooling1d_1/Max/reduction_indicesЖ
#text_cnn/global_max_pooling1d_1/MaxMax$text_cnn/conv1d_1/Relu:activations:0>text_cnn/global_max_pooling1d_1/Max/reduction_indices:output:0*
T0*(
_output_shapes
:         ђ2%
#text_cnn/global_max_pooling1d_1/MaxЮ
'text_cnn/conv1d_2/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
§        2)
'text_cnn/conv1d_2/conv1d/ExpandDims/dim■
#text_cnn/conv1d_2/conv1d/ExpandDims
ExpandDims5text_cnn/embedding/embedding_lookup/Identity:output:00text_cnn/conv1d_2/conv1d/ExpandDims/dim:output:0*
T0*2
_output_shapes 
:         аюг2%
#text_cnn/conv1d_2/conv1d/ExpandDims­
4text_cnn/conv1d_2/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp=text_cnn_conv1d_2_conv1d_expanddims_1_readvariableop_resource*$
_output_shapes
:гђ*
dtype026
4text_cnn/conv1d_2/conv1d/ExpandDims_1/ReadVariableOpў
)text_cnn/conv1d_2/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2+
)text_cnn/conv1d_2/conv1d/ExpandDims_1/dimЂ
%text_cnn/conv1d_2/conv1d/ExpandDims_1
ExpandDims<text_cnn/conv1d_2/conv1d/ExpandDims_1/ReadVariableOp:value:02text_cnn/conv1d_2/conv1d/ExpandDims_1/dim:output:0*
T0*(
_output_shapes
:гђ2'
%text_cnn/conv1d_2/conv1d/ExpandDims_1ѓ
text_cnn/conv1d_2/conv1dConv2D,text_cnn/conv1d_2/conv1d/ExpandDims:output:0.text_cnn/conv1d_2/conv1d/ExpandDims_1:output:0*
T0*2
_output_shapes 
:         ююђ*
paddingVALID*
strides
2
text_cnn/conv1d_2/conv1d╦
 text_cnn/conv1d_2/conv1d/SqueezeSqueeze!text_cnn/conv1d_2/conv1d:output:0*
T0*.
_output_shapes
:         ююђ*
squeeze_dims

§        2"
 text_cnn/conv1d_2/conv1d/Squeeze├
(text_cnn/conv1d_2/BiasAdd/ReadVariableOpReadVariableOp1text_cnn_conv1d_2_biasadd_readvariableop_resource*
_output_shapes	
:ђ*
dtype02*
(text_cnn/conv1d_2/BiasAdd/ReadVariableOpО
text_cnn/conv1d_2/BiasAddBiasAdd)text_cnn/conv1d_2/conv1d/Squeeze:output:00text_cnn/conv1d_2/BiasAdd/ReadVariableOp:value:0*
T0*.
_output_shapes
:         ююђ2
text_cnn/conv1d_2/BiasAddЋ
text_cnn/conv1d_2/ReluRelu"text_cnn/conv1d_2/BiasAdd:output:0*
T0*.
_output_shapes
:         ююђ2
text_cnn/conv1d_2/Relu░
5text_cnn/global_max_pooling1d_2/Max/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :27
5text_cnn/global_max_pooling1d_2/Max/reduction_indicesЖ
#text_cnn/global_max_pooling1d_2/MaxMax$text_cnn/conv1d_2/Relu:activations:0>text_cnn/global_max_pooling1d_2/Max/reduction_indices:output:0*
T0*(
_output_shapes
:         ђ2%
#text_cnn/global_max_pooling1d_2/Maxє
 text_cnn/concatenate/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2"
 text_cnn/concatenate/concat/axisх
text_cnn/concatenate/concatConcatV2*text_cnn/global_max_pooling1d/Max:output:0,text_cnn/global_max_pooling1d_1/Max:output:0,text_cnn/global_max_pooling1d_2/Max:output:0)text_cnn/concatenate/concat/axis:output:0*
N*
T0*(
_output_shapes
:         ђ2
text_cnn/concatenate/concat╗
$text_cnn/dense/MatMul/ReadVariableOpReadVariableOp-text_cnn_dense_matmul_readvariableop_resource*
_output_shapes
:	ђ*
dtype02&
$text_cnn/dense/MatMul/ReadVariableOpЙ
text_cnn/dense/MatMulMatMul$text_cnn/concatenate/concat:output:0,text_cnn/dense/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
text_cnn/dense/MatMul╣
%text_cnn/dense/BiasAdd/ReadVariableOpReadVariableOp.text_cnn_dense_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02'
%text_cnn/dense/BiasAdd/ReadVariableOpй
text_cnn/dense/BiasAddBiasAddtext_cnn/dense/MatMul:product:0-text_cnn/dense/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
text_cnn/dense/BiasAddј
text_cnn/dense/SoftmaxSoftmaxtext_cnn/dense/BiasAdd:output:0*
T0*'
_output_shapes
:         2
text_cnn/dense/Softmaxџ
IdentityIdentity text_cnn/dense/Softmax:softmax:0'^text_cnn/conv1d/BiasAdd/ReadVariableOp3^text_cnn/conv1d/conv1d/ExpandDims_1/ReadVariableOp)^text_cnn/conv1d_1/BiasAdd/ReadVariableOp5^text_cnn/conv1d_1/conv1d/ExpandDims_1/ReadVariableOp)^text_cnn/conv1d_2/BiasAdd/ReadVariableOp5^text_cnn/conv1d_2/conv1d/ExpandDims_1/ReadVariableOp&^text_cnn/dense/BiasAdd/ReadVariableOp%^text_cnn/dense/MatMul/ReadVariableOp3^text_cnn/embedding/embedding_lookup/ReadVariableOp*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*L
_input_shapes;
9:         аю:::::::::2P
&text_cnn/conv1d/BiasAdd/ReadVariableOp&text_cnn/conv1d/BiasAdd/ReadVariableOp2h
2text_cnn/conv1d/conv1d/ExpandDims_1/ReadVariableOp2text_cnn/conv1d/conv1d/ExpandDims_1/ReadVariableOp2T
(text_cnn/conv1d_1/BiasAdd/ReadVariableOp(text_cnn/conv1d_1/BiasAdd/ReadVariableOp2l
4text_cnn/conv1d_1/conv1d/ExpandDims_1/ReadVariableOp4text_cnn/conv1d_1/conv1d/ExpandDims_1/ReadVariableOp2T
(text_cnn/conv1d_2/BiasAdd/ReadVariableOp(text_cnn/conv1d_2/BiasAdd/ReadVariableOp2l
4text_cnn/conv1d_2/conv1d/ExpandDims_1/ReadVariableOp4text_cnn/conv1d_2/conv1d/ExpandDims_1/ReadVariableOp2N
%text_cnn/dense/BiasAdd/ReadVariableOp%text_cnn/dense/BiasAdd/ReadVariableOp2L
$text_cnn/dense/MatMul/ReadVariableOp$text_cnn/dense/MatMul/ReadVariableOp2h
2text_cnn/embedding/embedding_lookup/ReadVariableOp2text_cnn/embedding/embedding_lookup/ReadVariableOp:R N
)
_output_shapes
:         аю
!
_user_specified_name	input_1
╠
n
(__inference_embedding_layer_call_fn_3757

inputs
unknown
identityѕбStatefulPartitionedCallь
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *.
_output_shapes
:         аюг*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8ѓ *L
fGRE
C__inference_embedding_layer_call_and_return_conditional_losses_35432
StatefulPartitionedCallЋ
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*.
_output_shapes
:         аюг2

Identity"
identityIdentity:output:0*,
_input_shapes
:         аю:22
StatefulPartitionedCallStatefulPartitionedCall:Q M
)
_output_shapes
:         аю
 
_user_specified_nameinputs
Ѓ
j
N__inference_global_max_pooling1d_layer_call_and_return_conditional_losses_3498

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
:                  2
Maxi
IdentityIdentityMax:output:0*
T0*0
_output_shapes
:                  2

Identity"
identityIdentity:output:0*<
_input_shapes+
):'                           :e a
=
_output_shapes+
):'                           
 
_user_specified_nameinputs
«
ш
B__inference_conv1d_2_layer_call_and_return_conditional_losses_3843

inputs/
+conv1d_expanddims_1_readvariableop_resource#
biasadd_readvariableop_resource
identityѕбBiasAdd/ReadVariableOpб"conv1d/ExpandDims_1/ReadVariableOpy
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
§        2
conv1d/ExpandDims/dimЎ
conv1d/ExpandDims
ExpandDimsinputsconv1d/ExpandDims/dim:output:0*
T0*2
_output_shapes 
:         аюг2
conv1d/ExpandDims║
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*$
_output_shapes
:гђ*
dtype02$
"conv1d/ExpandDims_1/ReadVariableOpt
conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/ExpandDims_1/dim╣
conv1d/ExpandDims_1
ExpandDims*conv1d/ExpandDims_1/ReadVariableOp:value:0 conv1d/ExpandDims_1/dim:output:0*
T0*(
_output_shapes
:гђ2
conv1d/ExpandDims_1║
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*2
_output_shapes 
:         ююђ*
paddingVALID*
strides
2
conv1dЋ
conv1d/SqueezeSqueezeconv1d:output:0*
T0*.
_output_shapes
:         ююђ*
squeeze_dims

§        2
conv1d/SqueezeЇ
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
BiasAdd/ReadVariableOpЈ
BiasAddBiasAddconv1d/Squeeze:output:0BiasAdd/ReadVariableOp:value:0*
T0*.
_output_shapes
:         ююђ2	
BiasAdd_
ReluReluBiasAdd:output:0*
T0*.
_output_shapes
:         ююђ2
ReluФ
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp#^conv1d/ExpandDims_1/ReadVariableOp*
T0*.
_output_shapes
:         ююђ2

Identity"
identityIdentity:output:0*5
_input_shapes$
":         аюг::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2H
"conv1d/ExpandDims_1/ReadVariableOp"conv1d/ExpandDims_1/ReadVariableOp:V R
.
_output_shapes
:         аюг
 
_user_specified_nameinputs
┐

▓
C__inference_embedding_layer_call_and_return_conditional_losses_3750

inputs,
(embedding_lookup_readvariableop_resource
identityѕбembedding_lookup/ReadVariableOpГ
embedding_lookup/ReadVariableOpReadVariableOp(embedding_lookup_readvariableop_resource* 
_output_shapes
:
└>г*
dtype02!
embedding_lookup/ReadVariableOpц
embedding_lookup/axisConst*2
_class(
&$loc:@embedding_lookup/ReadVariableOp*
_output_shapes
: *
dtype0*
value	B : 2
embedding_lookup/axisЉ
embedding_lookupGatherV2'embedding_lookup/ReadVariableOp:value:0inputsembedding_lookup/axis:output:0*
Taxis0*
Tindices0*
Tparams0*2
_class(
&$loc:@embedding_lookup/ReadVariableOp*.
_output_shapes
:         аюг2
embedding_lookupќ
embedding_lookup/IdentityIdentityembedding_lookup:output:0*
T0*.
_output_shapes
:         аюг2
embedding_lookup/IdentityЪ
IdentityIdentity"embedding_lookup/Identity:output:0 ^embedding_lookup/ReadVariableOp*
T0*.
_output_shapes
:         аюг2

Identity"
identityIdentity:output:0*,
_input_shapes
:         аю:2B
embedding_lookup/ReadVariableOpembedding_lookup/ReadVariableOp:Q M
)
_output_shapes
:         аю
 
_user_specified_nameinputs
«
ш
B__inference_conv1d_1_layer_call_and_return_conditional_losses_3604

inputs/
+conv1d_expanddims_1_readvariableop_resource#
biasadd_readvariableop_resource
identityѕбBiasAdd/ReadVariableOpб"conv1d/ExpandDims_1/ReadVariableOpy
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
§        2
conv1d/ExpandDims/dimЎ
conv1d/ExpandDims
ExpandDimsinputsconv1d/ExpandDims/dim:output:0*
T0*2
_output_shapes 
:         аюг2
conv1d/ExpandDims║
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*$
_output_shapes
:гђ*
dtype02$
"conv1d/ExpandDims_1/ReadVariableOpt
conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/ExpandDims_1/dim╣
conv1d/ExpandDims_1
ExpandDims*conv1d/ExpandDims_1/ReadVariableOp:value:0 conv1d/ExpandDims_1/dim:output:0*
T0*(
_output_shapes
:гђ2
conv1d/ExpandDims_1║
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*2
_output_shapes 
:         Ююђ*
paddingVALID*
strides
2
conv1dЋ
conv1d/SqueezeSqueezeconv1d:output:0*
T0*.
_output_shapes
:         Ююђ*
squeeze_dims

§        2
conv1d/SqueezeЇ
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
BiasAdd/ReadVariableOpЈ
BiasAddBiasAddconv1d/Squeeze:output:0BiasAdd/ReadVariableOp:value:0*
T0*.
_output_shapes
:         Ююђ2	
BiasAdd_
ReluReluBiasAdd:output:0*
T0*.
_output_shapes
:         Ююђ2
ReluФ
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp#^conv1d/ExpandDims_1/ReadVariableOp*
T0*.
_output_shapes
:         Ююђ2

Identity"
identityIdentity:output:0*5
_input_shapes$
":         аюг::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2H
"conv1d/ExpandDims_1/ReadVariableOp"conv1d/ExpandDims_1/ReadVariableOp:V R
.
_output_shapes
:         аюг
 
_user_specified_nameinputs
З
|
'__inference_conv1d_2_layer_call_fn_3852

inputs
unknown
	unknown_0
identityѕбStatefulPartitionedCallщ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *.
_output_shapes
:         ююђ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8ѓ *K
fFRD
B__inference_conv1d_2_layer_call_and_return_conditional_losses_36372
StatefulPartitionedCallЋ
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*.
_output_shapes
:         ююђ2

Identity"
identityIdentity:output:0*5
_input_shapes$
":         аюг::22
StatefulPartitionedCallStatefulPartitionedCall:V R
.
_output_shapes
:         аюг
 
_user_specified_nameinputs
С
O
3__inference_global_max_pooling1d_layer_call_fn_3504

inputs
identityН
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:                  * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8ѓ *W
fRRP
N__inference_global_max_pooling1d_layer_call_and_return_conditional_losses_34982
PartitionedCallu
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:                  2

Identity"
identityIdentity:output:0*<
_input_shapes+
):'                           :e a
=
_output_shapes+
):'                           
 
_user_specified_nameinputs
«
ш
B__inference_conv1d_2_layer_call_and_return_conditional_losses_3637

inputs/
+conv1d_expanddims_1_readvariableop_resource#
biasadd_readvariableop_resource
identityѕбBiasAdd/ReadVariableOpб"conv1d/ExpandDims_1/ReadVariableOpy
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
§        2
conv1d/ExpandDims/dimЎ
conv1d/ExpandDims
ExpandDimsinputsconv1d/ExpandDims/dim:output:0*
T0*2
_output_shapes 
:         аюг2
conv1d/ExpandDims║
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*$
_output_shapes
:гђ*
dtype02$
"conv1d/ExpandDims_1/ReadVariableOpt
conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2
conv1d/ExpandDims_1/dim╣
conv1d/ExpandDims_1
ExpandDims*conv1d/ExpandDims_1/ReadVariableOp:value:0 conv1d/ExpandDims_1/dim:output:0*
T0*(
_output_shapes
:гђ2
conv1d/ExpandDims_1║
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*2
_output_shapes 
:         ююђ*
paddingVALID*
strides
2
conv1dЋ
conv1d/SqueezeSqueezeconv1d:output:0*
T0*.
_output_shapes
:         ююђ*
squeeze_dims

§        2
conv1d/SqueezeЇ
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
BiasAdd/ReadVariableOpЈ
BiasAddBiasAddconv1d/Squeeze:output:0BiasAdd/ReadVariableOp:value:0*
T0*.
_output_shapes
:         ююђ2	
BiasAdd_
ReluReluBiasAdd:output:0*
T0*.
_output_shapes
:         ююђ2
ReluФ
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp#^conv1d/ExpandDims_1/ReadVariableOp*
T0*.
_output_shapes
:         ююђ2

Identity"
identityIdentity:output:0*5
_input_shapes$
":         аюг::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2H
"conv1d/ExpandDims_1/ReadVariableOp"conv1d/ExpandDims_1/ReadVariableOp:V R
.
_output_shapes
:         аюг
 
_user_specified_nameinputs
З	
п
?__inference_dense_layer_call_and_return_conditional_losses_3768

inputs"
matmul_readvariableop_resource#
biasadd_readvariableop_resource
identityѕбBiasAdd/ReadVariableOpбMatMul/ReadVariableOpј
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ђ*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
MatMulї
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOpЂ
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2	
BiasAdda
SoftmaxSoftmaxBiasAdd:output:0*
T0*'
_output_shapes
:         2	
Softmaxќ
IdentityIdentitySoftmax:softmax:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*/
_input_shapes
:         ђ::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
­
z
%__inference_conv1d_layer_call_fn_3802

inputs
unknown
	unknown_0
identityѕбStatefulPartitionedCallэ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *.
_output_shapes
:         ъюђ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8ѓ *I
fDRB
@__inference_conv1d_layer_call_and_return_conditional_losses_35712
StatefulPartitionedCallЋ
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*.
_output_shapes
:         ъюђ2

Identity"
identityIdentity:output:0*5
_input_shapes$
":         аюг::22
StatefulPartitionedCallStatefulPartitionedCall:V R
.
_output_shapes
:         аюг
 
_user_specified_nameinputs
З
|
'__inference_conv1d_1_layer_call_fn_3827

inputs
unknown
	unknown_0
identityѕбStatefulPartitionedCallщ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *.
_output_shapes
:         Ююђ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8ѓ *K
fFRD
B__inference_conv1d_1_layer_call_and_return_conditional_losses_36042
StatefulPartitionedCallЋ
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*.
_output_shapes
:         Ююђ2

Identity"
identityIdentity:output:0*5
_input_shapes$
":         аюг::22
StatefulPartitionedCallStatefulPartitionedCall:V R
.
_output_shapes
:         аюг
 
_user_specified_nameinputs
Ё
l
P__inference_global_max_pooling1d_1_layer_call_and_return_conditional_losses_3511

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
:                  2
Maxi
IdentityIdentityMax:output:0*
T0*0
_output_shapes
:                  2

Identity"
identityIdentity:output:0*<
_input_shapes+
):'                           :e a
=
_output_shapes+
):'                           
 
_user_specified_nameinputs
Ё
l
P__inference_global_max_pooling1d_2_layer_call_and_return_conditional_losses_3524

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
:                  2
Maxi
IdentityIdentityMax:output:0*
T0*0
_output_shapes
:                  2

Identity"
identityIdentity:output:0*<
_input_shapes+
):'                           :e a
=
_output_shapes+
):'                           
 
_user_specified_nameinputs
У
Q
5__inference_global_max_pooling1d_2_layer_call_fn_3530

inputs
identityО
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:                  * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8ѓ *Y
fTRR
P__inference_global_max_pooling1d_2_layer_call_and_return_conditional_losses_35242
PartitionedCallu
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:                  2

Identity"
identityIdentity:output:0*<
_input_shapes+
):'                           :e a
=
_output_shapes+
):'                           
 
_user_specified_nameinputs"▒L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*Г
serving_defaultЎ
=
input_12
serving_default_input_1:0         аю<
output_10
StatefulPartitionedCall:0         tensorflow/serving/predict:ь─
▄
kernel_sizes
	embedding
	convs
max_poolings

classifier
	optimizer
trainable_variables
	variables
	regularization_losses

	keras_api

signatures
+і&call_and_return_all_conditional_losses
І__call__
ї_default_save_signature"└
_tf_keras_modelд{"class_name": "TextCNN", "name": "text_cnn", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "must_restore_from_config": false, "config": {"layer was saved without config": true}, "is_graph_network": false, "keras_version": "2.4.0", "backend": "tensorflow", "model_config": {"class_name": "TextCNN"}, "training_config": {"loss": "binary_crossentropy", "metrics": [[{"class_name": "MeanMetricWrapper", "config": {"name": "accuracy", "dtype": "float32", "fn": "categorical_accuracy"}}]], "weighted_metrics": null, "loss_weights": null, "optimizer_config": {"class_name": "Adam", "config": {"name": "Adam", "learning_rate": 0.0010000000474974513, "decay": 0.0, "beta_1": 0.8999999761581421, "beta_2": 0.9990000128746033, "epsilon": 1e-07, "amsgrad": false}}}}
 "
trackable_list_wrapper
│

embeddings
trainable_variables
	variables
regularization_losses
	keras_api
+Ї&call_and_return_all_conditional_losses
ј__call__"њ
_tf_keras_layerЭ{"class_name": "Embedding", "name": "embedding", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": {"class_name": "__tuple__", "items": [null, 20000]}, "stateful": false, "must_restore_from_config": false, "config": {"name": "embedding", "trainable": true, "batch_input_shape": {"class_name": "__tuple__", "items": [null, 20000]}, "dtype": "float32", "input_dim": 8000, "output_dim": 300, "embeddings_initializer": {"class_name": "RandomUniform", "config": {"minval": -0.05, "maxval": 0.05, "seed": null}}, "embeddings_regularizer": null, "activity_regularizer": null, "embeddings_constraint": null, "mask_zero": false, "input_length": 20000}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 20000]}}
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
Ы

kernel
bias
trainable_variables
	variables
regularization_losses
	keras_api
+Ј&call_and_return_all_conditional_losses
љ__call__"╦
_tf_keras_layer▒{"class_name": "Dense", "name": "dense", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "dense", "trainable": true, "dtype": "float32", "units": 6, "activation": "softmax", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 2, "axes": {"-1": 384}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 384]}}
 
iter

beta_1

beta_2
	 decay
!learning_ratemxmymz"m{#m|$m}%m~&m'mђvЂvѓvЃ"vё#vЁ$vє%vЄ&vѕ'vЅ"
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
╬
(non_trainable_variables
)layer_metrics
trainable_variables
*metrics

+layers
	variables
	regularization_losses
,layer_regularization_losses
І__call__
ї_default_save_signature
+і&call_and_return_all_conditional_losses
'і"call_and_return_conditional_losses"
_generic_user_object
-
Љserving_default"
signature_map
1:/
└>г2text_cnn/embedding/embeddings
'
0"
trackable_list_wrapper
'
0"
trackable_list_wrapper
 "
trackable_list_wrapper
░
-non_trainable_variables
.layer_metrics
trainable_variables

/layers
	variables
0metrics
regularization_losses
1layer_regularization_losses
ј__call__
+Ї&call_and_return_all_conditional_losses
'Ї"call_and_return_conditional_losses"
_generic_user_object
Ж	

"kernel
#bias
2trainable_variables
3	variables
4regularization_losses
5	keras_api
+њ&call_and_return_all_conditional_losses
Њ__call__"├
_tf_keras_layerЕ{"class_name": "Conv1D", "name": "conv1d", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "conv1d", "trainable": true, "dtype": "float32", "filters": 128, "kernel_size": {"class_name": "__tuple__", "items": [3]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 3, "axes": {"-1": 300}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 20000, 300]}}
Ь	

$kernel
%bias
6trainable_variables
7	variables
8regularization_losses
9	keras_api
+ћ&call_and_return_all_conditional_losses
Ћ__call__"К
_tf_keras_layerГ{"class_name": "Conv1D", "name": "conv1d_1", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "conv1d_1", "trainable": true, "dtype": "float32", "filters": 128, "kernel_size": {"class_name": "__tuple__", "items": [4]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 3, "axes": {"-1": 300}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 20000, 300]}}
Ь	

&kernel
'bias
:trainable_variables
;	variables
<regularization_losses
=	keras_api
+ќ&call_and_return_all_conditional_losses
Ќ__call__"К
_tf_keras_layerГ{"class_name": "Conv1D", "name": "conv1d_2", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "conv1d_2", "trainable": true, "dtype": "float32", "filters": 128, "kernel_size": {"class_name": "__tuple__", "items": [5]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 3, "axes": {"-1": 300}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 20000, 300]}}
Ѕ
>trainable_variables
?	variables
@regularization_losses
A	keras_api
+ў&call_and_return_all_conditional_losses
Ў__call__"Э
_tf_keras_layerя{"class_name": "GlobalMaxPooling1D", "name": "global_max_pooling1d", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "global_max_pooling1d", "trainable": true, "dtype": "float32", "data_format": "channels_last"}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": 3, "max_ndim": null, "min_ndim": null, "axes": {}}}}
Ї
Btrainable_variables
C	variables
Dregularization_losses
E	keras_api
+џ&call_and_return_all_conditional_losses
Џ__call__"Ч
_tf_keras_layerР{"class_name": "GlobalMaxPooling1D", "name": "global_max_pooling1d_1", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "global_max_pooling1d_1", "trainable": true, "dtype": "float32", "data_format": "channels_last"}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": 3, "max_ndim": null, "min_ndim": null, "axes": {}}}}
Ї
Ftrainable_variables
G	variables
Hregularization_losses
I	keras_api
+ю&call_and_return_all_conditional_losses
Ю__call__"Ч
_tf_keras_layerР{"class_name": "GlobalMaxPooling1D", "name": "global_max_pooling1d_2", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "global_max_pooling1d_2", "trainable": true, "dtype": "float32", "data_format": "channels_last"}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": 3, "max_ndim": null, "min_ndim": null, "axes": {}}}}
(:&	ђ2text_cnn/dense/kernel
!:2text_cnn/dense/bias
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
░
Jnon_trainable_variables
Klayer_metrics
trainable_variables

Llayers
	variables
Mmetrics
regularization_losses
Nlayer_regularization_losses
љ__call__
+Ј&call_and_return_all_conditional_losses
'Ј"call_and_return_conditional_losses"
_generic_user_object
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
.:,гђ2text_cnn/conv1d/kernel
#:!ђ2text_cnn/conv1d/bias
0:.гђ2text_cnn/conv1d_1/kernel
%:#ђ2text_cnn/conv1d_1/bias
0:.гђ2text_cnn/conv1d_2/kernel
%:#ђ2text_cnn/conv1d_2/bias
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
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
.
"0
#1"
trackable_list_wrapper
 "
trackable_list_wrapper
░
Qnon_trainable_variables
Rlayer_metrics
2trainable_variables

Slayers
3	variables
Tmetrics
4regularization_losses
Ulayer_regularization_losses
Њ__call__
+њ&call_and_return_all_conditional_losses
'њ"call_and_return_conditional_losses"
_generic_user_object
.
$0
%1"
trackable_list_wrapper
.
$0
%1"
trackable_list_wrapper
 "
trackable_list_wrapper
░
Vnon_trainable_variables
Wlayer_metrics
6trainable_variables

Xlayers
7	variables
Ymetrics
8regularization_losses
Zlayer_regularization_losses
Ћ__call__
+ћ&call_and_return_all_conditional_losses
'ћ"call_and_return_conditional_losses"
_generic_user_object
.
&0
'1"
trackable_list_wrapper
.
&0
'1"
trackable_list_wrapper
 "
trackable_list_wrapper
░
[non_trainable_variables
\layer_metrics
:trainable_variables

]layers
;	variables
^metrics
<regularization_losses
_layer_regularization_losses
Ќ__call__
+ќ&call_and_return_all_conditional_losses
'ќ"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
░
`non_trainable_variables
alayer_metrics
>trainable_variables

blayers
?	variables
cmetrics
@regularization_losses
dlayer_regularization_losses
Ў__call__
+ў&call_and_return_all_conditional_losses
'ў"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
░
enon_trainable_variables
flayer_metrics
Btrainable_variables

glayers
C	variables
hmetrics
Dregularization_losses
ilayer_regularization_losses
Џ__call__
+џ&call_and_return_all_conditional_losses
'џ"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
░
jnon_trainable_variables
klayer_metrics
Ftrainable_variables

llayers
G	variables
mmetrics
Hregularization_losses
nlayer_regularization_losses
Ю__call__
+ю&call_and_return_all_conditional_losses
'ю"call_and_return_conditional_losses"
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
╗
	ototal
	pcount
q	variables
r	keras_api"ё
_tf_keras_metricj{"class_name": "Mean", "name": "loss", "dtype": "float32", "config": {"name": "loss", "dtype": "float32"}}
 
	stotal
	tcount
u
_fn_kwargs
v	variables
w	keras_api"И
_tf_keras_metricЮ{"class_name": "MeanMetricWrapper", "name": "accuracy", "dtype": "float32", "config": {"name": "accuracy", "dtype": "float32", "fn": "categorical_accuracy"}}
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
└>г2$Adam/text_cnn/embedding/embeddings/m
-:+	ђ2Adam/text_cnn/dense/kernel/m
&:$2Adam/text_cnn/dense/bias/m
3:1гђ2Adam/text_cnn/conv1d/kernel/m
(:&ђ2Adam/text_cnn/conv1d/bias/m
5:3гђ2Adam/text_cnn/conv1d_1/kernel/m
*:(ђ2Adam/text_cnn/conv1d_1/bias/m
5:3гђ2Adam/text_cnn/conv1d_2/kernel/m
*:(ђ2Adam/text_cnn/conv1d_2/bias/m
6:4
└>г2$Adam/text_cnn/embedding/embeddings/v
-:+	ђ2Adam/text_cnn/dense/kernel/v
&:$2Adam/text_cnn/dense/bias/v
3:1гђ2Adam/text_cnn/conv1d/kernel/v
(:&ђ2Adam/text_cnn/conv1d/bias/v
5:3гђ2Adam/text_cnn/conv1d_1/kernel/v
*:(ђ2Adam/text_cnn/conv1d_1/bias/v
5:3гђ2Adam/text_cnn/conv1d_2/kernel/v
*:(ђ2Adam/text_cnn/conv1d_2/bias/v
њ2Ј
B__inference_text_cnn_layer_call_and_return_conditional_losses_3684╚
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *(б%
#і 
input_1         аю
э2З
'__inference_text_cnn_layer_call_fn_3708╚
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *(б%
#і 
input_1         аю
▀2▄
__inference__wrapped_model_3491И
І▓Є
FullArgSpec
argsџ 
varargsjargs
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *(б%
#і 
input_1         аю
ь2Ж
C__inference_embedding_layer_call_and_return_conditional_losses_3750б
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *
 
м2¤
(__inference_embedding_layer_call_fn_3757б
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *
 
ж2Т
?__inference_dense_layer_call_and_return_conditional_losses_3768б
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *
 
╬2╦
$__inference_dense_layer_call_fn_3777б
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *
 
╔Bк
"__inference_signature_wrapper_3741input_1"ћ
Ї▓Ѕ
FullArgSpec
argsџ 
varargs
 
varkwjkwargs
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *
 
Ж2у
@__inference_conv1d_layer_call_and_return_conditional_losses_3793б
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *
 
¤2╠
%__inference_conv1d_layer_call_fn_3802б
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *
 
В2ж
B__inference_conv1d_1_layer_call_and_return_conditional_losses_3818б
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *
 
Л2╬
'__inference_conv1d_1_layer_call_fn_3827б
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *
 
В2ж
B__inference_conv1d_2_layer_call_and_return_conditional_losses_3843б
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *
 
Л2╬
'__inference_conv1d_2_layer_call_fn_3852б
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *
 
Е2д
N__inference_global_max_pooling1d_layer_call_and_return_conditional_losses_3498М
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *3б0
.і+'                           
ј2І
3__inference_global_max_pooling1d_layer_call_fn_3504М
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *3б0
.і+'                           
Ф2е
P__inference_global_max_pooling1d_1_layer_call_and_return_conditional_losses_3511М
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *3б0
.і+'                           
љ2Ї
5__inference_global_max_pooling1d_1_layer_call_fn_3517М
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *3б0
.і+'                           
Ф2е
P__inference_global_max_pooling1d_2_layer_call_and_return_conditional_losses_3524М
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *3б0
.і+'                           
љ2Ї
5__inference_global_max_pooling1d_2_layer_call_fn_3530М
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *3б0
.і+'                           Ќ
__inference__wrapped_model_3491t	"#$%&'2б/
(б%
#і 
input_1         аю
ф "3ф0
.
output_1"і
output_1         ░
B__inference_conv1d_1_layer_call_and_return_conditional_losses_3818j$%6б3
,б)
'і$
inputs         аюг
ф ",б)
"і
0         Ююђ
џ ѕ
'__inference_conv1d_1_layer_call_fn_3827]$%6б3
,б)
'і$
inputs         аюг
ф "і         Ююђ░
B__inference_conv1d_2_layer_call_and_return_conditional_losses_3843j&'6б3
,б)
'і$
inputs         аюг
ф ",б)
"і
0         ююђ
џ ѕ
'__inference_conv1d_2_layer_call_fn_3852]&'6б3
,б)
'і$
inputs         аюг
ф "і         ююђ«
@__inference_conv1d_layer_call_and_return_conditional_losses_3793j"#6б3
,б)
'і$
inputs         аюг
ф ",б)
"і
0         ъюђ
џ є
%__inference_conv1d_layer_call_fn_3802]"#6б3
,б)
'і$
inputs         аюг
ф "і         ъюђа
?__inference_dense_layer_call_and_return_conditional_losses_3768]0б-
&б#
!і
inputs         ђ
ф "%б"
і
0         
џ x
$__inference_dense_layer_call_fn_3777P0б-
&б#
!і
inputs         ђ
ф "і         Ф
C__inference_embedding_layer_call_and_return_conditional_losses_3750d1б.
'б$
"і
inputs         аю
ф ",б)
"і
0         аюг
џ Ѓ
(__inference_embedding_layer_call_fn_3757W1б.
'б$
"і
inputs         аю
ф "і         аюг╦
P__inference_global_max_pooling1d_1_layer_call_and_return_conditional_losses_3511wEбB
;б8
6і3
inputs'                           
ф ".б+
$і!
0                  
џ Б
5__inference_global_max_pooling1d_1_layer_call_fn_3517jEбB
;б8
6і3
inputs'                           
ф "!і                  ╦
P__inference_global_max_pooling1d_2_layer_call_and_return_conditional_losses_3524wEбB
;б8
6і3
inputs'                           
ф ".б+
$і!
0                  
џ Б
5__inference_global_max_pooling1d_2_layer_call_fn_3530jEбB
;б8
6і3
inputs'                           
ф "!і                  ╔
N__inference_global_max_pooling1d_layer_call_and_return_conditional_losses_3498wEбB
;б8
6і3
inputs'                           
ф ".б+
$і!
0                  
џ А
3__inference_global_max_pooling1d_layer_call_fn_3504jEбB
;б8
6і3
inputs'                           
ф "!і                  Ц
"__inference_signature_wrapper_3741	"#$%&'=б:
б 
3ф0
.
input_1#і 
input_1         аю"3ф0
.
output_1"і
output_1         г
B__inference_text_cnn_layer_call_and_return_conditional_losses_3684f	"#$%&'2б/
(б%
#і 
input_1         аю
ф "%б"
і
0         
џ ё
'__inference_text_cnn_layer_call_fn_3708Y	"#$%&'2б/
(б%
#і 
input_1         аю
ф "і         