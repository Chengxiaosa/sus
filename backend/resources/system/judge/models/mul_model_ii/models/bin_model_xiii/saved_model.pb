ГЫ
к¤
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
dtypetypeИ
╛
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
executor_typestring И
q
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshapeИ"serve*2.2.02v2.2.0-rc4-8-g2b96f3662b8Ф╤
Ш
text_cnn/embedding/embeddingsVarHandleOp*
_output_shapes
: *
dtype0*
shape:
└>м*.
shared_nametext_cnn/embedding/embeddings
С
1text_cnn/embedding/embeddings/Read/ReadVariableOpReadVariableOptext_cnn/embedding/embeddings* 
_output_shapes
:
└>м*
dtype0
З
text_cnn/dense/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	А*&
shared_nametext_cnn/dense/kernel
А
)text_cnn/dense/kernel/Read/ReadVariableOpReadVariableOptext_cnn/dense/kernel*
_output_shapes
:	А*
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
О
text_cnn/conv1d/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:мА*'
shared_nametext_cnn/conv1d/kernel
З
*text_cnn/conv1d/kernel/Read/ReadVariableOpReadVariableOptext_cnn/conv1d/kernel*$
_output_shapes
:мА*
dtype0
Б
text_cnn/conv1d/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*%
shared_nametext_cnn/conv1d/bias
z
(text_cnn/conv1d/bias/Read/ReadVariableOpReadVariableOptext_cnn/conv1d/bias*
_output_shapes	
:А*
dtype0
Т
text_cnn/conv1d_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:мА*)
shared_nametext_cnn/conv1d_1/kernel
Л
,text_cnn/conv1d_1/kernel/Read/ReadVariableOpReadVariableOptext_cnn/conv1d_1/kernel*$
_output_shapes
:мА*
dtype0
Е
text_cnn/conv1d_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*'
shared_nametext_cnn/conv1d_1/bias
~
*text_cnn/conv1d_1/bias/Read/ReadVariableOpReadVariableOptext_cnn/conv1d_1/bias*
_output_shapes	
:А*
dtype0
Т
text_cnn/conv1d_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:мА*)
shared_nametext_cnn/conv1d_2/kernel
Л
,text_cnn/conv1d_2/kernel/Read/ReadVariableOpReadVariableOptext_cnn/conv1d_2/kernel*$
_output_shapes
:мА*
dtype0
Е
text_cnn/conv1d_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*'
shared_nametext_cnn/conv1d_2/bias
~
*text_cnn/conv1d_2/bias/Read/ReadVariableOpReadVariableOptext_cnn/conv1d_2/bias*
_output_shapes	
:А*
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
ж
$Adam/text_cnn/embedding/embeddings/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:
└>м*5
shared_name&$Adam/text_cnn/embedding/embeddings/m
Я
8Adam/text_cnn/embedding/embeddings/m/Read/ReadVariableOpReadVariableOp$Adam/text_cnn/embedding/embeddings/m* 
_output_shapes
:
└>м*
dtype0
Х
Adam/text_cnn/dense/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	А*-
shared_nameAdam/text_cnn/dense/kernel/m
О
0Adam/text_cnn/dense/kernel/m/Read/ReadVariableOpReadVariableOpAdam/text_cnn/dense/kernel/m*
_output_shapes
:	А*
dtype0
М
Adam/text_cnn/dense/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*+
shared_nameAdam/text_cnn/dense/bias/m
Е
.Adam/text_cnn/dense/bias/m/Read/ReadVariableOpReadVariableOpAdam/text_cnn/dense/bias/m*
_output_shapes
:*
dtype0
Ь
Adam/text_cnn/conv1d/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:мА*.
shared_nameAdam/text_cnn/conv1d/kernel/m
Х
1Adam/text_cnn/conv1d/kernel/m/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d/kernel/m*$
_output_shapes
:мА*
dtype0
П
Adam/text_cnn/conv1d/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*,
shared_nameAdam/text_cnn/conv1d/bias/m
И
/Adam/text_cnn/conv1d/bias/m/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d/bias/m*
_output_shapes	
:А*
dtype0
а
Adam/text_cnn/conv1d_1/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:мА*0
shared_name!Adam/text_cnn/conv1d_1/kernel/m
Щ
3Adam/text_cnn/conv1d_1/kernel/m/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d_1/kernel/m*$
_output_shapes
:мА*
dtype0
У
Adam/text_cnn/conv1d_1/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*.
shared_nameAdam/text_cnn/conv1d_1/bias/m
М
1Adam/text_cnn/conv1d_1/bias/m/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d_1/bias/m*
_output_shapes	
:А*
dtype0
а
Adam/text_cnn/conv1d_2/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:мА*0
shared_name!Adam/text_cnn/conv1d_2/kernel/m
Щ
3Adam/text_cnn/conv1d_2/kernel/m/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d_2/kernel/m*$
_output_shapes
:мА*
dtype0
У
Adam/text_cnn/conv1d_2/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*.
shared_nameAdam/text_cnn/conv1d_2/bias/m
М
1Adam/text_cnn/conv1d_2/bias/m/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d_2/bias/m*
_output_shapes	
:А*
dtype0
ж
$Adam/text_cnn/embedding/embeddings/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:
└>м*5
shared_name&$Adam/text_cnn/embedding/embeddings/v
Я
8Adam/text_cnn/embedding/embeddings/v/Read/ReadVariableOpReadVariableOp$Adam/text_cnn/embedding/embeddings/v* 
_output_shapes
:
└>м*
dtype0
Х
Adam/text_cnn/dense/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	А*-
shared_nameAdam/text_cnn/dense/kernel/v
О
0Adam/text_cnn/dense/kernel/v/Read/ReadVariableOpReadVariableOpAdam/text_cnn/dense/kernel/v*
_output_shapes
:	А*
dtype0
М
Adam/text_cnn/dense/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*+
shared_nameAdam/text_cnn/dense/bias/v
Е
.Adam/text_cnn/dense/bias/v/Read/ReadVariableOpReadVariableOpAdam/text_cnn/dense/bias/v*
_output_shapes
:*
dtype0
Ь
Adam/text_cnn/conv1d/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:мА*.
shared_nameAdam/text_cnn/conv1d/kernel/v
Х
1Adam/text_cnn/conv1d/kernel/v/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d/kernel/v*$
_output_shapes
:мА*
dtype0
П
Adam/text_cnn/conv1d/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*,
shared_nameAdam/text_cnn/conv1d/bias/v
И
/Adam/text_cnn/conv1d/bias/v/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d/bias/v*
_output_shapes	
:А*
dtype0
а
Adam/text_cnn/conv1d_1/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:мА*0
shared_name!Adam/text_cnn/conv1d_1/kernel/v
Щ
3Adam/text_cnn/conv1d_1/kernel/v/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d_1/kernel/v*$
_output_shapes
:мА*
dtype0
У
Adam/text_cnn/conv1d_1/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*.
shared_nameAdam/text_cnn/conv1d_1/bias/v
М
1Adam/text_cnn/conv1d_1/bias/v/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d_1/bias/v*
_output_shapes	
:А*
dtype0
а
Adam/text_cnn/conv1d_2/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:мА*0
shared_name!Adam/text_cnn/conv1d_2/kernel/v
Щ
3Adam/text_cnn/conv1d_2/kernel/v/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d_2/kernel/v*$
_output_shapes
:мА*
dtype0
У
Adam/text_cnn/conv1d_2/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*.
shared_nameAdam/text_cnn/conv1d_2/bias/v
М
1Adam/text_cnn/conv1d_2/bias/v/Read/ReadVariableOpReadVariableOpAdam/text_cnn/conv1d_2/bias/v*
_output_shapes	
:А*
dtype0

NoOpNoOp
▓:
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*э9
valueу9Bр9 B┘9
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
ь
iter

beta_1

beta_2
	 decay
!learning_ratemxmymz"m{#m|$m}%m~&m'mАvБvВvГ"vД#vЕ$vЖ%vЗ&vИ'vЙ
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
н
trainable_variables
(metrics

)layers
*non_trainable_variables
	variables
	regularization_losses
+layer_regularization_losses
,layer_metrics
 
b`
VARIABLE_VALUEtext_cnn/embedding/embeddings/embedding/embeddings/.ATTRIBUTES/VARIABLE_VALUE

0

0
 
н
trainable_variables
-metrics

.layers
/non_trainable_variables
	variables
regularization_losses
0layer_regularization_losses
1layer_metrics
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
н
trainable_variables
Jmetrics

Klayers
Lnon_trainable_variables
	variables
regularization_losses
Mlayer_regularization_losses
Nlayer_metrics
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
 
 

"0
#1

"0
#1
 
н
2trainable_variables
Qmetrics

Rlayers
Snon_trainable_variables
3	variables
4regularization_losses
Tlayer_regularization_losses
Ulayer_metrics

$0
%1

$0
%1
 
н
6trainable_variables
Vmetrics

Wlayers
Xnon_trainable_variables
7	variables
8regularization_losses
Ylayer_regularization_losses
Zlayer_metrics

&0
'1

&0
'1
 
н
:trainable_variables
[metrics

\layers
]non_trainable_variables
;	variables
<regularization_losses
^layer_regularization_losses
_layer_metrics
 
 
 
н
>trainable_variables
`metrics

alayers
bnon_trainable_variables
?	variables
@regularization_losses
clayer_regularization_losses
dlayer_metrics
 
 
 
н
Btrainable_variables
emetrics

flayers
gnon_trainable_variables
C	variables
Dregularization_losses
hlayer_regularization_losses
ilayer_metrics
 
 
 
н
Ftrainable_variables
jmetrics

klayers
lnon_trainable_variables
G	variables
Hregularization_losses
mlayer_regularization_losses
nlayer_metrics
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
ЖГ
VARIABLE_VALUE$Adam/text_cnn/embedding/embeddings/mKembedding/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/text_cnn/dense/kernel/mHclassifier/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
vt
VARIABLE_VALUEAdam/text_cnn/dense/bias/mFclassifier/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
}
VARIABLE_VALUEAdam/text_cnn/conv1d/kernel/mLtrainable_variables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUEAdam/text_cnn/conv1d/bias/mLtrainable_variables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
Б
VARIABLE_VALUEAdam/text_cnn/conv1d_1/kernel/mLtrainable_variables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
}
VARIABLE_VALUEAdam/text_cnn/conv1d_1/bias/mLtrainable_variables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
Б
VARIABLE_VALUEAdam/text_cnn/conv1d_2/kernel/mLtrainable_variables/5/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
}
VARIABLE_VALUEAdam/text_cnn/conv1d_2/bias/mLtrainable_variables/6/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
ЖГ
VARIABLE_VALUE$Adam/text_cnn/embedding/embeddings/vKembedding/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/text_cnn/dense/kernel/vHclassifier/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
vt
VARIABLE_VALUEAdam/text_cnn/dense/bias/vFclassifier/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
}
VARIABLE_VALUEAdam/text_cnn/conv1d/kernel/vLtrainable_variables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUEAdam/text_cnn/conv1d/bias/vLtrainable_variables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
Б
VARIABLE_VALUEAdam/text_cnn/conv1d_1/kernel/vLtrainable_variables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
}
VARIABLE_VALUEAdam/text_cnn/conv1d_1/bias/vLtrainable_variables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
Б
VARIABLE_VALUEAdam/text_cnn/conv1d_2/kernel/vLtrainable_variables/5/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
}
VARIABLE_VALUEAdam/text_cnn/conv1d_2/bias/vLtrainable_variables/6/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
|
serving_default_input_1Placeholder*(
_output_shapes
:         И'*
dtype0*
shape:         И'
¤
StatefulPartitionedCallStatefulPartitionedCallserving_default_input_1text_cnn/embedding/embeddingstext_cnn/conv1d/kerneltext_cnn/conv1d/biastext_cnn/conv1d_1/kerneltext_cnn/conv1d_1/biastext_cnn/conv1d_2/kerneltext_cnn/conv1d_2/biastext_cnn/dense/kerneltext_cnn/dense/bias*
Tin
2
*
Tout
2*'
_output_shapes
:         *+
_read_only_resource_inputs
		**
config_proto

CPU

GPU 2J 8*+
f&R$
"__inference_signature_wrapper_5597
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
х
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
__inference__traced_save_5768
Р	
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
 __inference__traced_restore_5888ям
╞
Q
5__inference_global_max_pooling1d_1_layer_call_fn_5445

inputs
identity╡
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*0
_output_shapes
:                  * 
_read_only_resource_inputs
 **
config_proto

CPU

GPU 2J 8*Y
fTRR
P__inference_global_max_pooling1d_1_layer_call_and_return_conditional_losses_54392
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
к
|
'__inference_conv1d_2_layer_call_fn_5419

inputs
unknown
	unknown_0
identityИвStatefulPartitionedCall▐
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*5
_output_shapes#
!:                  А*$
_read_only_resource_inputs
**
config_proto

CPU

GPU 2J 8*K
fFRD
B__inference_conv1d_2_layer_call_and_return_conditional_losses_54092
StatefulPartitionedCallЬ
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*5
_output_shapes#
!:                  А2

Identity"
identityIdentity:output:0*<
_input_shapes+
):                  м::22
StatefulPartitionedCallStatefulPartitionedCall:] Y
5
_output_shapes#
!:                  м
 
_user_specified_nameinputs:

_output_shapes
: :

_output_shapes
: 
╞
Q
5__inference_global_max_pooling1d_2_layer_call_fn_5458

inputs
identity╡
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*0
_output_shapes
:                  * 
_read_only_resource_inputs
 **
config_proto

CPU

GPU 2J 8*Y
fTRR
P__inference_global_max_pooling1d_2_layer_call_and_return_conditional_losses_54522
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
ы
з
?__inference_dense_layer_call_and_return_conditional_losses_5522

inputs"
matmul_readvariableop_resource#
biasadd_readvariableop_resource
identityИО
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	А*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
MatMulМ
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOpБ
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2	
BiasAdda
SoftmaxSoftmaxBiasAdd:output:0*
T0*'
_output_shapes
:         2	
Softmaxe
IdentityIdentitySoftmax:softmax:0*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*/
_input_shapes
:         А:::P L
(
_output_shapes
:         А
 
_user_specified_nameinputs:

_output_shapes
: :

_output_shapes
: 
В

с
"__inference_signature_wrapper_5597
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
identityИвStatefulPartitionedCallЙ
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7*
Tin
2
*
Tout
2*'
_output_shapes
:         *+
_read_only_resource_inputs
		**
config_proto

CPU

GPU 2J 8*(
f#R!
__inference__wrapped_model_53382
StatefulPartitionedCallО
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*K
_input_shapes:
8:         И':::::::::22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:         И'
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
ь2
п
B__inference_text_cnn_layer_call_and_return_conditional_losses_5540
input_1
embedding_5480
conv1d_5484
conv1d_5486
conv1d_1_5492
conv1d_1_5494
conv1d_2_5500
conv1d_2_5502

dense_5533

dense_5535
identityИвconv1d/StatefulPartitionedCallв conv1d_1/StatefulPartitionedCallв conv1d_2/StatefulPartitionedCallвdense/StatefulPartitionedCallв!embedding/StatefulPartitionedCallц
!embedding/StatefulPartitionedCallStatefulPartitionedCallinput_1embedding_5480*
Tin
2*
Tout
2*-
_output_shapes
:         И'м*#
_read_only_resource_inputs
**
config_proto

CPU

GPU 2J 8*L
fGRE
C__inference_embedding_layer_call_and_return_conditional_losses_54712#
!embedding/StatefulPartitionedCall╝
embedding/IdentityIdentity*embedding/StatefulPartitionedCall:output:0"^embedding/StatefulPartitionedCall*
T0*-
_output_shapes
:         И'м2
embedding/Identity¤
conv1d/StatefulPartitionedCallStatefulPartitionedCallembedding/Identity:output:0conv1d_5484conv1d_5486*
Tin
2*
Tout
2*-
_output_shapes
:         Ж'А*$
_read_only_resource_inputs
**
config_proto

CPU

GPU 2J 8*I
fDRB
@__inference_conv1d_layer_call_and_return_conditional_losses_53552 
conv1d/StatefulPartitionedCall░
conv1d/IdentityIdentity'conv1d/StatefulPartitionedCall:output:0^conv1d/StatefulPartitionedCall*
T0*-
_output_shapes
:         Ж'А2
conv1d/Identityч
$global_max_pooling1d/PartitionedCallPartitionedCallconv1d/Identity:output:0*
Tin
2*
Tout
2*(
_output_shapes
:         А* 
_read_only_resource_inputs
 **
config_proto

CPU

GPU 2J 8*W
fRRP
N__inference_global_max_pooling1d_layer_call_and_return_conditional_losses_54262&
$global_max_pooling1d/PartitionedCallм
global_max_pooling1d/IdentityIdentity-global_max_pooling1d/PartitionedCall:output:0*
T0*(
_output_shapes
:         А2
global_max_pooling1d/IdentityЗ
 conv1d_1/StatefulPartitionedCallStatefulPartitionedCallembedding/Identity:output:0conv1d_1_5492conv1d_1_5494*
Tin
2*
Tout
2*-
_output_shapes
:         Е'А*$
_read_only_resource_inputs
**
config_proto

CPU

GPU 2J 8*K
fFRD
B__inference_conv1d_1_layer_call_and_return_conditional_losses_53822"
 conv1d_1/StatefulPartitionedCall╕
conv1d_1/IdentityIdentity)conv1d_1/StatefulPartitionedCall:output:0!^conv1d_1/StatefulPartitionedCall*
T0*-
_output_shapes
:         Е'А2
conv1d_1/Identityя
&global_max_pooling1d_1/PartitionedCallPartitionedCallconv1d_1/Identity:output:0*
Tin
2*
Tout
2*(
_output_shapes
:         А* 
_read_only_resource_inputs
 **
config_proto

CPU

GPU 2J 8*Y
fTRR
P__inference_global_max_pooling1d_1_layer_call_and_return_conditional_losses_54392(
&global_max_pooling1d_1/PartitionedCall▓
global_max_pooling1d_1/IdentityIdentity/global_max_pooling1d_1/PartitionedCall:output:0*
T0*(
_output_shapes
:         А2!
global_max_pooling1d_1/IdentityЗ
 conv1d_2/StatefulPartitionedCallStatefulPartitionedCallembedding/Identity:output:0conv1d_2_5500conv1d_2_5502*
Tin
2*
Tout
2*-
_output_shapes
:         Д'А*$
_read_only_resource_inputs
**
config_proto

CPU

GPU 2J 8*K
fFRD
B__inference_conv1d_2_layer_call_and_return_conditional_losses_54092"
 conv1d_2/StatefulPartitionedCall╕
conv1d_2/IdentityIdentity)conv1d_2/StatefulPartitionedCall:output:0!^conv1d_2/StatefulPartitionedCall*
T0*-
_output_shapes
:         Д'А2
conv1d_2/Identityя
&global_max_pooling1d_2/PartitionedCallPartitionedCallconv1d_2/Identity:output:0*
Tin
2*
Tout
2*(
_output_shapes
:         А* 
_read_only_resource_inputs
 **
config_proto

CPU

GPU 2J 8*Y
fTRR
P__inference_global_max_pooling1d_2_layer_call_and_return_conditional_losses_54522(
&global_max_pooling1d_2/PartitionedCall▓
global_max_pooling1d_2/IdentityIdentity/global_max_pooling1d_2/PartitionedCall:output:0*
T0*(
_output_shapes
:         А2!
global_max_pooling1d_2/Identityt
concatenate/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concatenate/concat/axisО
concatenate/concatConcatV2&global_max_pooling1d/Identity:output:0(global_max_pooling1d_1/Identity:output:0(global_max_pooling1d_2/Identity:output:0 concatenate/concat/axis:output:0*
N*
T0*(
_output_shapes
:         А2
concatenate/concatИ
concatenate/IdentityIdentityconcatenate/concat:output:0*
T0*(
_output_shapes
:         А2
concatenate/IdentityЇ
dense/StatefulPartitionedCallStatefulPartitionedCallconcatenate/Identity:output:0
dense_5533
dense_5535*
Tin
2*
Tout
2*'
_output_shapes
:         *$
_read_only_resource_inputs
**
config_proto

CPU

GPU 2J 8*H
fCRA
?__inference_dense_layer_call_and_return_conditional_losses_55222
dense/StatefulPartitionedCallж
dense/IdentityIdentity&dense/StatefulPartitionedCall:output:0^dense/StatefulPartitionedCall*
T0*'
_output_shapes
:         2
dense/IdentityЦ
IdentityIdentitydense/Identity:output:0^conv1d/StatefulPartitionedCall!^conv1d_1/StatefulPartitionedCall!^conv1d_2/StatefulPartitionedCall^dense/StatefulPartitionedCall"^embedding/StatefulPartitionedCall*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*K
_input_shapes:
8:         И':::::::::2@
conv1d/StatefulPartitionedCallconv1d/StatefulPartitionedCall2D
 conv1d_1/StatefulPartitionedCall conv1d_1/StatefulPartitionedCall2D
 conv1d_2/StatefulPartitionedCall conv1d_2/StatefulPartitionedCall2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2F
!embedding/StatefulPartitionedCall!embedding/StatefulPartitionedCall:Q M
(
_output_shapes
:         И'
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
№U
╤
__inference__wrapped_model_5338
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
identityИц
2text_cnn/embedding/embedding_lookup/ReadVariableOpReadVariableOp;text_cnn_embedding_embedding_lookup_readvariableop_resource* 
_output_shapes
:
└>м*
dtype024
2text_cnn/embedding/embedding_lookup/ReadVariableOp▌
(text_cnn/embedding/embedding_lookup/axisConst*E
_class;
97loc:@text_cnn/embedding/embedding_lookup/ReadVariableOp*
_output_shapes
: *
dtype0*
value	B : 2*
(text_cnn/embedding/embedding_lookup/axisЁ
#text_cnn/embedding/embedding_lookupGatherV2:text_cnn/embedding/embedding_lookup/ReadVariableOp:value:0input_11text_cnn/embedding/embedding_lookup/axis:output:0*
Taxis0*
Tindices0*
Tparams0*E
_class;
97loc:@text_cnn/embedding/embedding_lookup/ReadVariableOp*-
_output_shapes
:         И'м2%
#text_cnn/embedding/embedding_lookup╬
,text_cnn/embedding/embedding_lookup/IdentityIdentity,text_cnn/embedding/embedding_lookup:output:0*
T0*-
_output_shapes
:         И'м2.
,text_cnn/embedding/embedding_lookup/IdentityР
%text_cnn/conv1d/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2'
%text_cnn/conv1d/conv1d/ExpandDims/dimў
!text_cnn/conv1d/conv1d/ExpandDims
ExpandDims5text_cnn/embedding/embedding_lookup/Identity:output:0.text_cnn/conv1d/conv1d/ExpandDims/dim:output:0*
T0*1
_output_shapes
:         И'м2#
!text_cnn/conv1d/conv1d/ExpandDimsъ
2text_cnn/conv1d/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp;text_cnn_conv1d_conv1d_expanddims_1_readvariableop_resource*$
_output_shapes
:мА*
dtype024
2text_cnn/conv1d/conv1d/ExpandDims_1/ReadVariableOpФ
'text_cnn/conv1d/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2)
'text_cnn/conv1d/conv1d/ExpandDims_1/dim∙
#text_cnn/conv1d/conv1d/ExpandDims_1
ExpandDims:text_cnn/conv1d/conv1d/ExpandDims_1/ReadVariableOp:value:00text_cnn/conv1d/conv1d/ExpandDims_1/dim:output:0*
T0*(
_output_shapes
:мА2%
#text_cnn/conv1d/conv1d/ExpandDims_1∙
text_cnn/conv1d/conv1dConv2D*text_cnn/conv1d/conv1d/ExpandDims:output:0,text_cnn/conv1d/conv1d/ExpandDims_1:output:0*
T0*1
_output_shapes
:         Ж'А*
paddingVALID*
strides
2
text_cnn/conv1d/conv1d╗
text_cnn/conv1d/conv1d/SqueezeSqueezetext_cnn/conv1d/conv1d:output:0*
T0*-
_output_shapes
:         Ж'А*
squeeze_dims
2 
text_cnn/conv1d/conv1d/Squeeze╜
&text_cnn/conv1d/BiasAdd/ReadVariableOpReadVariableOp/text_cnn_conv1d_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype02(
&text_cnn/conv1d/BiasAdd/ReadVariableOp╬
text_cnn/conv1d/BiasAddBiasAdd'text_cnn/conv1d/conv1d/Squeeze:output:0.text_cnn/conv1d/BiasAdd/ReadVariableOp:value:0*
T0*-
_output_shapes
:         Ж'А2
text_cnn/conv1d/BiasAddО
text_cnn/conv1d/ReluRelu text_cnn/conv1d/BiasAdd:output:0*
T0*-
_output_shapes
:         Ж'А2
text_cnn/conv1d/Reluм
3text_cnn/global_max_pooling1d/Max/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :25
3text_cnn/global_max_pooling1d/Max/reduction_indicesт
!text_cnn/global_max_pooling1d/MaxMax"text_cnn/conv1d/Relu:activations:0<text_cnn/global_max_pooling1d/Max/reduction_indices:output:0*
T0*(
_output_shapes
:         А2#
!text_cnn/global_max_pooling1d/MaxФ
'text_cnn/conv1d_1/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2)
'text_cnn/conv1d_1/conv1d/ExpandDims/dim¤
#text_cnn/conv1d_1/conv1d/ExpandDims
ExpandDims5text_cnn/embedding/embedding_lookup/Identity:output:00text_cnn/conv1d_1/conv1d/ExpandDims/dim:output:0*
T0*1
_output_shapes
:         И'м2%
#text_cnn/conv1d_1/conv1d/ExpandDimsЁ
4text_cnn/conv1d_1/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp=text_cnn_conv1d_1_conv1d_expanddims_1_readvariableop_resource*$
_output_shapes
:мА*
dtype026
4text_cnn/conv1d_1/conv1d/ExpandDims_1/ReadVariableOpШ
)text_cnn/conv1d_1/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2+
)text_cnn/conv1d_1/conv1d/ExpandDims_1/dimБ
%text_cnn/conv1d_1/conv1d/ExpandDims_1
ExpandDims<text_cnn/conv1d_1/conv1d/ExpandDims_1/ReadVariableOp:value:02text_cnn/conv1d_1/conv1d/ExpandDims_1/dim:output:0*
T0*(
_output_shapes
:мА2'
%text_cnn/conv1d_1/conv1d/ExpandDims_1Б
text_cnn/conv1d_1/conv1dConv2D,text_cnn/conv1d_1/conv1d/ExpandDims:output:0.text_cnn/conv1d_1/conv1d/ExpandDims_1:output:0*
T0*1
_output_shapes
:         Е'А*
paddingVALID*
strides
2
text_cnn/conv1d_1/conv1d┴
 text_cnn/conv1d_1/conv1d/SqueezeSqueeze!text_cnn/conv1d_1/conv1d:output:0*
T0*-
_output_shapes
:         Е'А*
squeeze_dims
2"
 text_cnn/conv1d_1/conv1d/Squeeze├
(text_cnn/conv1d_1/BiasAdd/ReadVariableOpReadVariableOp1text_cnn_conv1d_1_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype02*
(text_cnn/conv1d_1/BiasAdd/ReadVariableOp╓
text_cnn/conv1d_1/BiasAddBiasAdd)text_cnn/conv1d_1/conv1d/Squeeze:output:00text_cnn/conv1d_1/BiasAdd/ReadVariableOp:value:0*
T0*-
_output_shapes
:         Е'А2
text_cnn/conv1d_1/BiasAddФ
text_cnn/conv1d_1/ReluRelu"text_cnn/conv1d_1/BiasAdd:output:0*
T0*-
_output_shapes
:         Е'А2
text_cnn/conv1d_1/Relu░
5text_cnn/global_max_pooling1d_1/Max/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :27
5text_cnn/global_max_pooling1d_1/Max/reduction_indicesъ
#text_cnn/global_max_pooling1d_1/MaxMax$text_cnn/conv1d_1/Relu:activations:0>text_cnn/global_max_pooling1d_1/Max/reduction_indices:output:0*
T0*(
_output_shapes
:         А2%
#text_cnn/global_max_pooling1d_1/MaxФ
'text_cnn/conv1d_2/conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2)
'text_cnn/conv1d_2/conv1d/ExpandDims/dim¤
#text_cnn/conv1d_2/conv1d/ExpandDims
ExpandDims5text_cnn/embedding/embedding_lookup/Identity:output:00text_cnn/conv1d_2/conv1d/ExpandDims/dim:output:0*
T0*1
_output_shapes
:         И'м2%
#text_cnn/conv1d_2/conv1d/ExpandDimsЁ
4text_cnn/conv1d_2/conv1d/ExpandDims_1/ReadVariableOpReadVariableOp=text_cnn_conv1d_2_conv1d_expanddims_1_readvariableop_resource*$
_output_shapes
:мА*
dtype026
4text_cnn/conv1d_2/conv1d/ExpandDims_1/ReadVariableOpШ
)text_cnn/conv1d_2/conv1d/ExpandDims_1/dimConst*
_output_shapes
: *
dtype0*
value	B : 2+
)text_cnn/conv1d_2/conv1d/ExpandDims_1/dimБ
%text_cnn/conv1d_2/conv1d/ExpandDims_1
ExpandDims<text_cnn/conv1d_2/conv1d/ExpandDims_1/ReadVariableOp:value:02text_cnn/conv1d_2/conv1d/ExpandDims_1/dim:output:0*
T0*(
_output_shapes
:мА2'
%text_cnn/conv1d_2/conv1d/ExpandDims_1Б
text_cnn/conv1d_2/conv1dConv2D,text_cnn/conv1d_2/conv1d/ExpandDims:output:0.text_cnn/conv1d_2/conv1d/ExpandDims_1:output:0*
T0*1
_output_shapes
:         Д'А*
paddingVALID*
strides
2
text_cnn/conv1d_2/conv1d┴
 text_cnn/conv1d_2/conv1d/SqueezeSqueeze!text_cnn/conv1d_2/conv1d:output:0*
T0*-
_output_shapes
:         Д'А*
squeeze_dims
2"
 text_cnn/conv1d_2/conv1d/Squeeze├
(text_cnn/conv1d_2/BiasAdd/ReadVariableOpReadVariableOp1text_cnn_conv1d_2_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype02*
(text_cnn/conv1d_2/BiasAdd/ReadVariableOp╓
text_cnn/conv1d_2/BiasAddBiasAdd)text_cnn/conv1d_2/conv1d/Squeeze:output:00text_cnn/conv1d_2/BiasAdd/ReadVariableOp:value:0*
T0*-
_output_shapes
:         Д'А2
text_cnn/conv1d_2/BiasAddФ
text_cnn/conv1d_2/ReluRelu"text_cnn/conv1d_2/BiasAdd:output:0*
T0*-
_output_shapes
:         Д'А2
text_cnn/conv1d_2/Relu░
5text_cnn/global_max_pooling1d_2/Max/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :27
5text_cnn/global_max_pooling1d_2/Max/reduction_indicesъ
#text_cnn/global_max_pooling1d_2/MaxMax$text_cnn/conv1d_2/Relu:activations:0>text_cnn/global_max_pooling1d_2/Max/reduction_indices:output:0*
T0*(
_output_shapes
:         А2%
#text_cnn/global_max_pooling1d_2/MaxЖ
 text_cnn/concatenate/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2"
 text_cnn/concatenate/concat/axis╡
text_cnn/concatenate/concatConcatV2*text_cnn/global_max_pooling1d/Max:output:0,text_cnn/global_max_pooling1d_1/Max:output:0,text_cnn/global_max_pooling1d_2/Max:output:0)text_cnn/concatenate/concat/axis:output:0*
N*
T0*(
_output_shapes
:         А2
text_cnn/concatenate/concat╗
$text_cnn/dense/MatMul/ReadVariableOpReadVariableOp-text_cnn_dense_matmul_readvariableop_resource*
_output_shapes
:	А*
dtype02&
$text_cnn/dense/MatMul/ReadVariableOp╛
text_cnn/dense/MatMulMatMul$text_cnn/concatenate/concat:output:0,text_cnn/dense/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
text_cnn/dense/MatMul╣
%text_cnn/dense/BiasAdd/ReadVariableOpReadVariableOp.text_cnn_dense_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02'
%text_cnn/dense/BiasAdd/ReadVariableOp╜
text_cnn/dense/BiasAddBiasAddtext_cnn/dense/MatMul:product:0-text_cnn/dense/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
text_cnn/dense/BiasAddО
text_cnn/dense/SoftmaxSoftmaxtext_cnn/dense/BiasAdd:output:0*
T0*'
_output_shapes
:         2
text_cnn/dense/Softmaxt
IdentityIdentity text_cnn/dense/Softmax:softmax:0*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*K
_input_shapes:
8:         И'::::::::::Q M
(
_output_shapes
:         И'
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
Г
j
N__inference_global_max_pooling1d_layer_call_and_return_conditional_losses_5426

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
╧	
Р
C__inference_embedding_layer_call_and_return_conditional_losses_5606

inputs,
(embedding_lookup_readvariableop_resource
identityИн
embedding_lookup/ReadVariableOpReadVariableOp(embedding_lookup_readvariableop_resource* 
_output_shapes
:
└>м*
dtype02!
embedding_lookup/ReadVariableOpд
embedding_lookup/axisConst*2
_class(
&$loc:@embedding_lookup/ReadVariableOp*
_output_shapes
: *
dtype0*
value	B : 2
embedding_lookup/axisР
embedding_lookupGatherV2'embedding_lookup/ReadVariableOp:value:0inputsembedding_lookup/axis:output:0*
Taxis0*
Tindices0*
Tparams0*2
_class(
&$loc:@embedding_lookup/ReadVariableOp*-
_output_shapes
:         И'м2
embedding_lookupХ
embedding_lookup/IdentityIdentityembedding_lookup:output:0*
T0*-
_output_shapes
:         И'м2
embedding_lookup/Identity|
IdentityIdentity"embedding_lookup/Identity:output:0*
T0*-
_output_shapes
:         И'м2

Identity"
identityIdentity:output:0*+
_input_shapes
:         И'::P L
(
_output_shapes
:         И'
 
_user_specified_nameinputs:

_output_shapes
: 
ж
z
%__inference_conv1d_layer_call_fn_5365

inputs
unknown
	unknown_0
identityИвStatefulPartitionedCall▄
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*5
_output_shapes#
!:                  А*$
_read_only_resource_inputs
**
config_proto

CPU

GPU 2J 8*I
fDRB
@__inference_conv1d_layer_call_and_return_conditional_losses_53552
StatefulPartitionedCallЬ
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*5
_output_shapes#
!:                  А2

Identity"
identityIdentity:output:0*<
_input_shapes+
):                  м::22
StatefulPartitionedCallStatefulPartitionedCall:] Y
5
_output_shapes#
!:                  м
 
_user_specified_nameinputs:

_output_shapes
: :

_output_shapes
: 
╧	
Р
C__inference_embedding_layer_call_and_return_conditional_losses_5471

inputs,
(embedding_lookup_readvariableop_resource
identityИн
embedding_lookup/ReadVariableOpReadVariableOp(embedding_lookup_readvariableop_resource* 
_output_shapes
:
└>м*
dtype02!
embedding_lookup/ReadVariableOpд
embedding_lookup/axisConst*2
_class(
&$loc:@embedding_lookup/ReadVariableOp*
_output_shapes
: *
dtype0*
value	B : 2
embedding_lookup/axisР
embedding_lookupGatherV2'embedding_lookup/ReadVariableOp:value:0inputsembedding_lookup/axis:output:0*
Taxis0*
Tindices0*
Tparams0*2
_class(
&$loc:@embedding_lookup/ReadVariableOp*-
_output_shapes
:         И'м2
embedding_lookupХ
embedding_lookup/IdentityIdentityembedding_lookup:output:0*
T0*-
_output_shapes
:         И'м2
embedding_lookup/Identity|
IdentityIdentity"embedding_lookup/Identity:output:0*
T0*-
_output_shapes
:         И'м2

Identity"
identityIdentity:output:0*+
_input_shapes
:         И'::P L
(
_output_shapes
:         И'
 
_user_specified_nameinputs:

_output_shapes
: 
Ч
╖
B__inference_conv1d_1_layer_call_and_return_conditional_losses_5382

inputs/
+conv1d_expanddims_1_readvariableop_resource#
biasadd_readvariableop_resource
identityИp
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2
conv1d/ExpandDims/dimа
conv1d/ExpandDims
ExpandDimsinputsconv1d/ExpandDims/dim:output:0*
T0*9
_output_shapes'
%:#                  м2
conv1d/ExpandDims║
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*$
_output_shapes
:мА*
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
:мА2
conv1d/ExpandDims_1┴
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*9
_output_shapes'
%:#                  А*
paddingVALID*
strides
2
conv1dУ
conv1d/SqueezeSqueezeconv1d:output:0*
T0*5
_output_shapes#
!:                  А*
squeeze_dims
2
conv1d/SqueezeН
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:А*
dtype02
BiasAdd/ReadVariableOpЦ
BiasAddBiasAddconv1d/Squeeze:output:0BiasAdd/ReadVariableOp:value:0*
T0*5
_output_shapes#
!:                  А2	
BiasAddf
ReluReluBiasAdd:output:0*
T0*5
_output_shapes#
!:                  А2
Relut
IdentityIdentityRelu:activations:0*
T0*5
_output_shapes#
!:                  А2

Identity"
identityIdentity:output:0*<
_input_shapes+
):                  м:::] Y
5
_output_shapes#
!:                  м
 
_user_specified_nameinputs:

_output_shapes
: :

_output_shapes
: 
╙W
╓
__inference__traced_save_5768
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

identity_1ИвMergeV2CheckpointsвSaveV2вSaveV2_1П
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
ConstН
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*<
value3B1 B+_temp_9c679e7f0e3a4d6391a64d5176e39904/part2	
Const_1Л
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
ShardedFilename/shardж
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: 2
ShardedFilename▌
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:$*
dtype0*я
valueхBт$B/embedding/embeddings/.ATTRIBUTES/VARIABLE_VALUEB,classifier/kernel/.ATTRIBUTES/VARIABLE_VALUEB*classifier/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB0trainable_variables/1/.ATTRIBUTES/VARIABLE_VALUEB0trainable_variables/2/.ATTRIBUTES/VARIABLE_VALUEB0trainable_variables/3/.ATTRIBUTES/VARIABLE_VALUEB0trainable_variables/4/.ATTRIBUTES/VARIABLE_VALUEB0trainable_variables/5/.ATTRIBUTES/VARIABLE_VALUEB0trainable_variables/6/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBKembedding/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBHclassifier/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBFclassifier/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/5/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/6/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBKembedding/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBHclassifier/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBFclassifier/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/5/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/6/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE2
SaveV2/tensor_names╨
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:$*
dtype0*[
valueRBP$B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 2
SaveV2/shape_and_slicesХ
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:08savev2_text_cnn_embedding_embeddings_read_readvariableop0savev2_text_cnn_dense_kernel_read_readvariableop.savev2_text_cnn_dense_bias_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop1savev2_text_cnn_conv1d_kernel_read_readvariableop/savev2_text_cnn_conv1d_bias_read_readvariableop3savev2_text_cnn_conv1d_1_kernel_read_readvariableop1savev2_text_cnn_conv1d_1_bias_read_readvariableop3savev2_text_cnn_conv1d_2_kernel_read_readvariableop1savev2_text_cnn_conv1d_2_bias_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop"savev2_total_1_read_readvariableop"savev2_count_1_read_readvariableop?savev2_adam_text_cnn_embedding_embeddings_m_read_readvariableop7savev2_adam_text_cnn_dense_kernel_m_read_readvariableop5savev2_adam_text_cnn_dense_bias_m_read_readvariableop8savev2_adam_text_cnn_conv1d_kernel_m_read_readvariableop6savev2_adam_text_cnn_conv1d_bias_m_read_readvariableop:savev2_adam_text_cnn_conv1d_1_kernel_m_read_readvariableop8savev2_adam_text_cnn_conv1d_1_bias_m_read_readvariableop:savev2_adam_text_cnn_conv1d_2_kernel_m_read_readvariableop8savev2_adam_text_cnn_conv1d_2_bias_m_read_readvariableop?savev2_adam_text_cnn_embedding_embeddings_v_read_readvariableop7savev2_adam_text_cnn_dense_kernel_v_read_readvariableop5savev2_adam_text_cnn_dense_bias_v_read_readvariableop8savev2_adam_text_cnn_conv1d_kernel_v_read_readvariableop6savev2_adam_text_cnn_conv1d_bias_v_read_readvariableop:savev2_adam_text_cnn_conv1d_1_kernel_v_read_readvariableop8savev2_adam_text_cnn_conv1d_1_bias_v_read_readvariableop:savev2_adam_text_cnn_conv1d_2_kernel_v_read_readvariableop8savev2_adam_text_cnn_conv1d_2_bias_v_read_readvariableop"/device:CPU:0*
_output_shapes
 *2
dtypes(
&2$	2
SaveV2Г
ShardedFilename_1/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B :2
ShardedFilename_1/shardм
ShardedFilename_1ShardedFilenameStringJoin:output:0 ShardedFilename_1/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: 2
ShardedFilename_1в
SaveV2_1/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*1
value(B&B_CHECKPOINTABLE_OBJECT_GRAPH2
SaveV2_1/tensor_namesО
SaveV2_1/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*
valueB
B 2
SaveV2_1/shape_and_slices╧
SaveV2_1SaveV2ShardedFilename_1:filename:0SaveV2_1/tensor_names:output:0"SaveV2_1/shape_and_slices:output:0savev2_1_const^SaveV2"/device:CPU:0*
_output_shapes
 *
dtypes
22

SaveV2_1у
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0ShardedFilename_1:filename:0^SaveV2	^SaveV2_1"/device:CPU:0*
N*
T0*
_output_shapes
:2(
&MergeV2Checkpoints/checkpoint_prefixesм
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix	^SaveV2_1"/device:CPU:0*
_output_shapes
 2
MergeV2Checkpointsr
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: 2

IdentityБ

Identity_1IdentityIdentity:output:0^MergeV2Checkpoints^SaveV2	^SaveV2_1*
T0*
_output_shapes
: 2

Identity_1"!

identity_1Identity_1:output:0*╤
_input_shapes┐
╝: :
└>м:	А:: : : : : :мА:А:мА:А:мА:А: : : : :
└>м:	А::мА:А:мА:А:мА:А:
└>м:	А::мА:А:мА:А:мА:А: 2(
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
└>м:%!

_output_shapes
:	А: 
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
:мА:!


_output_shapes	
:А:*&
$
_output_shapes
:мА:!

_output_shapes	
:А:*&
$
_output_shapes
:мА:!

_output_shapes	
:А:
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
└>м:%!

_output_shapes
:	А: 

_output_shapes
::*&
$
_output_shapes
:мА:!

_output_shapes	
:А:*&
$
_output_shapes
:мА:!

_output_shapes	
:А:*&
$
_output_shapes
:мА:!

_output_shapes	
:А:&"
 
_output_shapes
:
└>м:%!

_output_shapes
:	А: 

_output_shapes
::*&
$
_output_shapes
:мА:! 

_output_shapes	
:А:*!&
$
_output_shapes
:мА:!"

_output_shapes	
:А:*#&
$
_output_shapes
:мА:!$

_output_shapes	
:А:%

_output_shapes
: 
Е
l
P__inference_global_max_pooling1d_1_layer_call_and_return_conditional_losses_5439

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
к
|
'__inference_conv1d_1_layer_call_fn_5392

inputs
unknown
	unknown_0
identityИвStatefulPartitionedCall▐
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*5
_output_shapes#
!:                  А*$
_read_only_resource_inputs
**
config_proto

CPU

GPU 2J 8*K
fFRD
B__inference_conv1d_1_layer_call_and_return_conditional_losses_53822
StatefulPartitionedCallЬ
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*5
_output_shapes#
!:                  А2

Identity"
identityIdentity:output:0*<
_input_shapes+
):                  м::22
StatefulPartitionedCallStatefulPartitionedCall:] Y
5
_output_shapes#
!:                  м
 
_user_specified_nameinputs:

_output_shapes
: :

_output_shapes
: 
БЯ
╗
 __inference__traced_restore_5888
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
identity_37ИвAssignVariableOpвAssignVariableOp_1вAssignVariableOp_10вAssignVariableOp_11вAssignVariableOp_12вAssignVariableOp_13вAssignVariableOp_14вAssignVariableOp_15вAssignVariableOp_16вAssignVariableOp_17вAssignVariableOp_18вAssignVariableOp_19вAssignVariableOp_2вAssignVariableOp_20вAssignVariableOp_21вAssignVariableOp_22вAssignVariableOp_23вAssignVariableOp_24вAssignVariableOp_25вAssignVariableOp_26вAssignVariableOp_27вAssignVariableOp_28вAssignVariableOp_29вAssignVariableOp_3вAssignVariableOp_30вAssignVariableOp_31вAssignVariableOp_32вAssignVariableOp_33вAssignVariableOp_34вAssignVariableOp_35вAssignVariableOp_4вAssignVariableOp_5вAssignVariableOp_6вAssignVariableOp_7вAssignVariableOp_8вAssignVariableOp_9в	RestoreV2вRestoreV2_1у
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:$*
dtype0*я
valueхBт$B/embedding/embeddings/.ATTRIBUTES/VARIABLE_VALUEB,classifier/kernel/.ATTRIBUTES/VARIABLE_VALUEB*classifier/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB0trainable_variables/1/.ATTRIBUTES/VARIABLE_VALUEB0trainable_variables/2/.ATTRIBUTES/VARIABLE_VALUEB0trainable_variables/3/.ATTRIBUTES/VARIABLE_VALUEB0trainable_variables/4/.ATTRIBUTES/VARIABLE_VALUEB0trainable_variables/5/.ATTRIBUTES/VARIABLE_VALUEB0trainable_variables/6/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBKembedding/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBHclassifier/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBFclassifier/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/5/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/6/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBKembedding/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBHclassifier/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBFclassifier/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/5/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBLtrainable_variables/6/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE2
RestoreV2/tensor_names╓
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:$*
dtype0*[
valueRBP$B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 2
RestoreV2/shape_and_slicesт
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*ж
_output_shapesУ
Р::::::::::::::::::::::::::::::::::::*2
dtypes(
&2$	2
	RestoreV2X
IdentityIdentityRestoreV2:tensors:0*
T0*
_output_shapes
:2

IdentityЮ
AssignVariableOpAssignVariableOp.assignvariableop_text_cnn_embedding_embeddingsIdentity:output:0*
_output_shapes
 *
dtype02
AssignVariableOp\

Identity_1IdentityRestoreV2:tensors:1*
T0*
_output_shapes
:2

Identity_1Ю
AssignVariableOp_1AssignVariableOp(assignvariableop_1_text_cnn_dense_kernelIdentity_1:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_1\

Identity_2IdentityRestoreV2:tensors:2*
T0*
_output_shapes
:2

Identity_2Ь
AssignVariableOp_2AssignVariableOp&assignvariableop_2_text_cnn_dense_biasIdentity_2:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_2\

Identity_3IdentityRestoreV2:tensors:3*
T0	*
_output_shapes
:2

Identity_3Т
AssignVariableOp_3AssignVariableOpassignvariableop_3_adam_iterIdentity_3:output:0*
_output_shapes
 *
dtype0	2
AssignVariableOp_3\

Identity_4IdentityRestoreV2:tensors:4*
T0*
_output_shapes
:2

Identity_4Ф
AssignVariableOp_4AssignVariableOpassignvariableop_4_adam_beta_1Identity_4:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_4\

Identity_5IdentityRestoreV2:tensors:5*
T0*
_output_shapes
:2

Identity_5Ф
AssignVariableOp_5AssignVariableOpassignvariableop_5_adam_beta_2Identity_5:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_5\

Identity_6IdentityRestoreV2:tensors:6*
T0*
_output_shapes
:2

Identity_6У
AssignVariableOp_6AssignVariableOpassignvariableop_6_adam_decayIdentity_6:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_6\

Identity_7IdentityRestoreV2:tensors:7*
T0*
_output_shapes
:2

Identity_7Ы
AssignVariableOp_7AssignVariableOp%assignvariableop_7_adam_learning_rateIdentity_7:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_7\

Identity_8IdentityRestoreV2:tensors:8*
T0*
_output_shapes
:2

Identity_8Я
AssignVariableOp_8AssignVariableOp)assignvariableop_8_text_cnn_conv1d_kernelIdentity_8:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_8\

Identity_9IdentityRestoreV2:tensors:9*
T0*
_output_shapes
:2

Identity_9Э
AssignVariableOp_9AssignVariableOp'assignvariableop_9_text_cnn_conv1d_biasIdentity_9:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_9_
Identity_10IdentityRestoreV2:tensors:10*
T0*
_output_shapes
:2
Identity_10е
AssignVariableOp_10AssignVariableOp,assignvariableop_10_text_cnn_conv1d_1_kernelIdentity_10:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_10_
Identity_11IdentityRestoreV2:tensors:11*
T0*
_output_shapes
:2
Identity_11г
AssignVariableOp_11AssignVariableOp*assignvariableop_11_text_cnn_conv1d_1_biasIdentity_11:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_11_
Identity_12IdentityRestoreV2:tensors:12*
T0*
_output_shapes
:2
Identity_12е
AssignVariableOp_12AssignVariableOp,assignvariableop_12_text_cnn_conv1d_2_kernelIdentity_12:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_12_
Identity_13IdentityRestoreV2:tensors:13*
T0*
_output_shapes
:2
Identity_13г
AssignVariableOp_13AssignVariableOp*assignvariableop_13_text_cnn_conv1d_2_biasIdentity_13:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_13_
Identity_14IdentityRestoreV2:tensors:14*
T0*
_output_shapes
:2
Identity_14Т
AssignVariableOp_14AssignVariableOpassignvariableop_14_totalIdentity_14:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_14_
Identity_15IdentityRestoreV2:tensors:15*
T0*
_output_shapes
:2
Identity_15Т
AssignVariableOp_15AssignVariableOpassignvariableop_15_countIdentity_15:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_15_
Identity_16IdentityRestoreV2:tensors:16*
T0*
_output_shapes
:2
Identity_16Ф
AssignVariableOp_16AssignVariableOpassignvariableop_16_total_1Identity_16:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_16_
Identity_17IdentityRestoreV2:tensors:17*
T0*
_output_shapes
:2
Identity_17Ф
AssignVariableOp_17AssignVariableOpassignvariableop_17_count_1Identity_17:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_17_
Identity_18IdentityRestoreV2:tensors:18*
T0*
_output_shapes
:2
Identity_18▒
AssignVariableOp_18AssignVariableOp8assignvariableop_18_adam_text_cnn_embedding_embeddings_mIdentity_18:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_18_
Identity_19IdentityRestoreV2:tensors:19*
T0*
_output_shapes
:2
Identity_19й
AssignVariableOp_19AssignVariableOp0assignvariableop_19_adam_text_cnn_dense_kernel_mIdentity_19:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_19_
Identity_20IdentityRestoreV2:tensors:20*
T0*
_output_shapes
:2
Identity_20з
AssignVariableOp_20AssignVariableOp.assignvariableop_20_adam_text_cnn_dense_bias_mIdentity_20:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_20_
Identity_21IdentityRestoreV2:tensors:21*
T0*
_output_shapes
:2
Identity_21к
AssignVariableOp_21AssignVariableOp1assignvariableop_21_adam_text_cnn_conv1d_kernel_mIdentity_21:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_21_
Identity_22IdentityRestoreV2:tensors:22*
T0*
_output_shapes
:2
Identity_22и
AssignVariableOp_22AssignVariableOp/assignvariableop_22_adam_text_cnn_conv1d_bias_mIdentity_22:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_22_
Identity_23IdentityRestoreV2:tensors:23*
T0*
_output_shapes
:2
Identity_23м
AssignVariableOp_23AssignVariableOp3assignvariableop_23_adam_text_cnn_conv1d_1_kernel_mIdentity_23:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_23_
Identity_24IdentityRestoreV2:tensors:24*
T0*
_output_shapes
:2
Identity_24к
AssignVariableOp_24AssignVariableOp1assignvariableop_24_adam_text_cnn_conv1d_1_bias_mIdentity_24:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_24_
Identity_25IdentityRestoreV2:tensors:25*
T0*
_output_shapes
:2
Identity_25м
AssignVariableOp_25AssignVariableOp3assignvariableop_25_adam_text_cnn_conv1d_2_kernel_mIdentity_25:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_25_
Identity_26IdentityRestoreV2:tensors:26*
T0*
_output_shapes
:2
Identity_26к
AssignVariableOp_26AssignVariableOp1assignvariableop_26_adam_text_cnn_conv1d_2_bias_mIdentity_26:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_26_
Identity_27IdentityRestoreV2:tensors:27*
T0*
_output_shapes
:2
Identity_27▒
AssignVariableOp_27AssignVariableOp8assignvariableop_27_adam_text_cnn_embedding_embeddings_vIdentity_27:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_27_
Identity_28IdentityRestoreV2:tensors:28*
T0*
_output_shapes
:2
Identity_28й
AssignVariableOp_28AssignVariableOp0assignvariableop_28_adam_text_cnn_dense_kernel_vIdentity_28:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_28_
Identity_29IdentityRestoreV2:tensors:29*
T0*
_output_shapes
:2
Identity_29з
AssignVariableOp_29AssignVariableOp.assignvariableop_29_adam_text_cnn_dense_bias_vIdentity_29:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_29_
Identity_30IdentityRestoreV2:tensors:30*
T0*
_output_shapes
:2
Identity_30к
AssignVariableOp_30AssignVariableOp1assignvariableop_30_adam_text_cnn_conv1d_kernel_vIdentity_30:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_30_
Identity_31IdentityRestoreV2:tensors:31*
T0*
_output_shapes
:2
Identity_31и
AssignVariableOp_31AssignVariableOp/assignvariableop_31_adam_text_cnn_conv1d_bias_vIdentity_31:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_31_
Identity_32IdentityRestoreV2:tensors:32*
T0*
_output_shapes
:2
Identity_32м
AssignVariableOp_32AssignVariableOp3assignvariableop_32_adam_text_cnn_conv1d_1_kernel_vIdentity_32:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_32_
Identity_33IdentityRestoreV2:tensors:33*
T0*
_output_shapes
:2
Identity_33к
AssignVariableOp_33AssignVariableOp1assignvariableop_33_adam_text_cnn_conv1d_1_bias_vIdentity_33:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_33_
Identity_34IdentityRestoreV2:tensors:34*
T0*
_output_shapes
:2
Identity_34м
AssignVariableOp_34AssignVariableOp3assignvariableop_34_adam_text_cnn_conv1d_2_kernel_vIdentity_34:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_34_
Identity_35IdentityRestoreV2:tensors:35*
T0*
_output_shapes
:2
Identity_35к
AssignVariableOp_35AssignVariableOp1assignvariableop_35_adam_text_cnn_conv1d_2_bias_vIdentity_35:output:0*
_output_shapes
 *
dtype02
AssignVariableOp_35и
RestoreV2_1/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*1
value(B&B_CHECKPOINTABLE_OBJECT_GRAPH2
RestoreV2_1/tensor_namesФ
RestoreV2_1/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*
valueB
B 2
RestoreV2_1/shape_and_slices─
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
NoOpЎ
Identity_36Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: 2
Identity_36Г
Identity_37IdentityIdentity_36:output:0^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9
^RestoreV2^RestoreV2_1*
T0*
_output_shapes
: 2
Identity_37"#
identity_37Identity_37:output:0*з
_input_shapesХ
Т: ::::::::::::::::::::::::::::::::::::2$
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
: 
Ч
╖
B__inference_conv1d_2_layer_call_and_return_conditional_losses_5409

inputs/
+conv1d_expanddims_1_readvariableop_resource#
biasadd_readvariableop_resource
identityИp
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2
conv1d/ExpandDims/dimа
conv1d/ExpandDims
ExpandDimsinputsconv1d/ExpandDims/dim:output:0*
T0*9
_output_shapes'
%:#                  м2
conv1d/ExpandDims║
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*$
_output_shapes
:мА*
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
:мА2
conv1d/ExpandDims_1┴
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*9
_output_shapes'
%:#                  А*
paddingVALID*
strides
2
conv1dУ
conv1d/SqueezeSqueezeconv1d:output:0*
T0*5
_output_shapes#
!:                  А*
squeeze_dims
2
conv1d/SqueezeН
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:А*
dtype02
BiasAdd/ReadVariableOpЦ
BiasAddBiasAddconv1d/Squeeze:output:0BiasAdd/ReadVariableOp:value:0*
T0*5
_output_shapes#
!:                  А2	
BiasAddf
ReluReluBiasAdd:output:0*
T0*5
_output_shapes#
!:                  А2
Relut
IdentityIdentityRelu:activations:0*
T0*5
_output_shapes#
!:                  А2

Identity"
identityIdentity:output:0*<
_input_shapes+
):                  м:::] Y
5
_output_shapes#
!:                  м
 
_user_specified_nameinputs:

_output_shapes
: :

_output_shapes
: 
ы
з
?__inference_dense_layer_call_and_return_conditional_losses_5624

inputs"
matmul_readvariableop_resource#
biasadd_readvariableop_resource
identityИО
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	А*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
MatMulМ
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOpБ
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2	
BiasAdda
SoftmaxSoftmaxBiasAdd:output:0*
T0*'
_output_shapes
:         2	
Softmaxe
IdentityIdentitySoftmax:softmax:0*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*/
_input_shapes
:         А:::P L
(
_output_shapes
:         А
 
_user_specified_nameinputs:

_output_shapes
: :

_output_shapes
: 
ю
y
$__inference_dense_layer_call_fn_5633

inputs
unknown
	unknown_0
identityИвStatefulPartitionedCall═
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*'
_output_shapes
:         *$
_read_only_resource_inputs
**
config_proto

CPU

GPU 2J 8*H
fCRA
?__inference_dense_layer_call_and_return_conditional_losses_55222
StatefulPartitionedCallО
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*/
_input_shapes
:         А::22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:         А
 
_user_specified_nameinputs:

_output_shapes
: :

_output_shapes
: 
Е
l
P__inference_global_max_pooling1d_2_layer_call_and_return_conditional_losses_5452

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
─
n
(__inference_embedding_layer_call_fn_5613

inputs
unknown
identityИвStatefulPartitionedCall╩
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*-
_output_shapes
:         И'м*#
_read_only_resource_inputs
**
config_proto

CPU

GPU 2J 8*L
fGRE
C__inference_embedding_layer_call_and_return_conditional_losses_54712
StatefulPartitionedCallФ
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*-
_output_shapes
:         И'м2

Identity"
identityIdentity:output:0*+
_input_shapes
:         И':22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:         И'
 
_user_specified_nameinputs:

_output_shapes
: 
┬
O
3__inference_global_max_pooling1d_layer_call_fn_5432

inputs
identity│
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*0
_output_shapes
:                  * 
_read_only_resource_inputs
 **
config_proto

CPU

GPU 2J 8*W
fRRP
N__inference_global_max_pooling1d_layer_call_and_return_conditional_losses_54262
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
к

ц
'__inference_text_cnn_layer_call_fn_5564
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
identityИвStatefulPartitionedCallм
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7*
Tin
2
*
Tout
2*'
_output_shapes
:         *+
_read_only_resource_inputs
		**
config_proto

CPU

GPU 2J 8*K
fFRD
B__inference_text_cnn_layer_call_and_return_conditional_losses_55402
StatefulPartitionedCallО
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:         2

Identity"
identityIdentity:output:0*K
_input_shapes:
8:         И':::::::::22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:         И'
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
Х
╡
@__inference_conv1d_layer_call_and_return_conditional_losses_5355

inputs/
+conv1d_expanddims_1_readvariableop_resource#
biasadd_readvariableop_resource
identityИp
conv1d/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2
conv1d/ExpandDims/dimа
conv1d/ExpandDims
ExpandDimsinputsconv1d/ExpandDims/dim:output:0*
T0*9
_output_shapes'
%:#                  м2
conv1d/ExpandDims║
"conv1d/ExpandDims_1/ReadVariableOpReadVariableOp+conv1d_expanddims_1_readvariableop_resource*$
_output_shapes
:мА*
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
:мА2
conv1d/ExpandDims_1┴
conv1dConv2Dconv1d/ExpandDims:output:0conv1d/ExpandDims_1:output:0*
T0*9
_output_shapes'
%:#                  А*
paddingVALID*
strides
2
conv1dУ
conv1d/SqueezeSqueezeconv1d:output:0*
T0*5
_output_shapes#
!:                  А*
squeeze_dims
2
conv1d/SqueezeН
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:А*
dtype02
BiasAdd/ReadVariableOpЦ
BiasAddBiasAddconv1d/Squeeze:output:0BiasAdd/ReadVariableOp:value:0*
T0*5
_output_shapes#
!:                  А2	
BiasAddf
ReluReluBiasAdd:output:0*
T0*5
_output_shapes#
!:                  А2
Relut
IdentityIdentityRelu:activations:0*
T0*5
_output_shapes#
!:                  А2

Identity"
identityIdentity:output:0*<
_input_shapes+
):                  м:::] Y
5
_output_shapes#
!:                  м
 
_user_specified_nameinputs:

_output_shapes
: :

_output_shapes
: "пL
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*м
serving_defaultШ
<
input_11
serving_default_input_1:0         И'<
output_10
StatefulPartitionedCall:0         tensorflow/serving/predict:▄┬
ы
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
К_default_save_signature
Л__call__
+М&call_and_return_all_conditional_losses"╧
_tf_keras_model╡{"class_name": "TextCNN", "name": "text_cnn", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "config": {"layer was saved without config": true}, "is_graph_network": false, "keras_version": "2.3.0-tf", "backend": "tensorflow", "model_config": {"class_name": "TextCNN"}, "training_config": {"loss": "binary_crossentropy", "metrics": ["accuracy"], "weighted_metrics": null, "loss_weights": null, "sample_weight_mode": null, "optimizer_config": {"class_name": "Adam", "config": {"name": "Adam", "learning_rate": 0.0010000000474974513, "decay": 0.0, "beta_1": 0.8999999761581421, "beta_2": 0.9990000128746033, "epsilon": 1e-07, "amsgrad": false}}}}
 "
trackable_list_wrapper
М

embeddings
trainable_variables
	variables
regularization_losses
	keras_api
Н__call__
+О&call_and_return_all_conditional_losses"ы
_tf_keras_layer╤{"class_name": "Embedding", "name": "embedding", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": {"class_name": "__tuple__", "items": [null, 5000]}, "stateful": false, "config": {"name": "embedding", "trainable": true, "batch_input_shape": {"class_name": "__tuple__", "items": [null, 5000]}, "dtype": "float32", "input_dim": 8000, "output_dim": 300, "embeddings_initializer": {"class_name": "RandomUniform", "config": {"minval": -0.05, "maxval": 0.05, "seed": null}}, "embeddings_regularizer": null, "activity_regularizer": null, "embeddings_constraint": null, "mask_zero": false, "input_length": 5000}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 5000]}}
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
╧

kernel
bias
trainable_variables
	variables
regularization_losses
	keras_api
П__call__
+Р&call_and_return_all_conditional_losses"и
_tf_keras_layerО{"class_name": "Dense", "name": "dense", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "config": {"name": "dense", "trainable": true, "dtype": "float32", "units": 2, "activation": "softmax", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 2, "axes": {"-1": 384}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 384]}}
 
iter

beta_1

beta_2
	 decay
!learning_ratemxmymz"m{#m|$m}%m~&m'mАvБvВvГ"vД#vЕ$vЖ%vЗ&vИ'vЙ"
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
trainable_variables
(metrics

)layers
*non_trainable_variables
	variables
	regularization_losses
+layer_regularization_losses
,layer_metrics
Л__call__
К_default_save_signature
+М&call_and_return_all_conditional_losses
'М"call_and_return_conditional_losses"
_generic_user_object
-
Сserving_default"
signature_map
1:/
└>м2text_cnn/embedding/embeddings
'
0"
trackable_list_wrapper
'
0"
trackable_list_wrapper
 "
trackable_list_wrapper
░
trainable_variables
-metrics

.layers
/non_trainable_variables
	variables
regularization_losses
0layer_regularization_losses
1layer_metrics
Н__call__
+О&call_and_return_all_conditional_losses
'О"call_and_return_conditional_losses"
_generic_user_object
╣	

"kernel
#bias
2trainable_variables
3	variables
4regularization_losses
5	keras_api
Т__call__
+У&call_and_return_all_conditional_losses"Т
_tf_keras_layer°{"class_name": "Conv1D", "name": "conv1d", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "config": {"name": "conv1d", "trainable": true, "dtype": "float32", "filters": 128, "kernel_size": {"class_name": "__tuple__", "items": [3]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1]}, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": 3, "max_ndim": null, "min_ndim": null, "axes": {"-1": 300}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 5000, 300]}}
╜	

$kernel
%bias
6trainable_variables
7	variables
8regularization_losses
9	keras_api
Ф__call__
+Х&call_and_return_all_conditional_losses"Ц
_tf_keras_layer№{"class_name": "Conv1D", "name": "conv1d_1", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "config": {"name": "conv1d_1", "trainable": true, "dtype": "float32", "filters": 128, "kernel_size": {"class_name": "__tuple__", "items": [4]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1]}, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": 3, "max_ndim": null, "min_ndim": null, "axes": {"-1": 300}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 5000, 300]}}
╜	

&kernel
'bias
:trainable_variables
;	variables
<regularization_losses
=	keras_api
Ц__call__
+Ч&call_and_return_all_conditional_losses"Ц
_tf_keras_layer№{"class_name": "Conv1D", "name": "conv1d_2", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "config": {"name": "conv1d_2", "trainable": true, "dtype": "float32", "filters": 128, "kernel_size": {"class_name": "__tuple__", "items": [5]}, "strides": {"class_name": "__tuple__", "items": [1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1]}, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": 3, "max_ndim": null, "min_ndim": null, "axes": {"-1": 300}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 5000, 300]}}
ц
>trainable_variables
?	variables
@regularization_losses
A	keras_api
Ш__call__
+Щ&call_and_return_all_conditional_losses"╒
_tf_keras_layer╗{"class_name": "GlobalMaxPooling1D", "name": "global_max_pooling1d", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "config": {"name": "global_max_pooling1d", "trainable": true, "dtype": "float32", "data_format": "channels_last"}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": 3, "max_ndim": null, "min_ndim": null, "axes": {}}}}
ъ
Btrainable_variables
C	variables
Dregularization_losses
E	keras_api
Ъ__call__
+Ы&call_and_return_all_conditional_losses"┘
_tf_keras_layer┐{"class_name": "GlobalMaxPooling1D", "name": "global_max_pooling1d_1", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "config": {"name": "global_max_pooling1d_1", "trainable": true, "dtype": "float32", "data_format": "channels_last"}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": 3, "max_ndim": null, "min_ndim": null, "axes": {}}}}
ъ
Ftrainable_variables
G	variables
Hregularization_losses
I	keras_api
Ь__call__
+Э&call_and_return_all_conditional_losses"┘
_tf_keras_layer┐{"class_name": "GlobalMaxPooling1D", "name": "global_max_pooling1d_2", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "config": {"name": "global_max_pooling1d_2", "trainable": true, "dtype": "float32", "data_format": "channels_last"}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": 3, "max_ndim": null, "min_ndim": null, "axes": {}}}}
(:&	А2text_cnn/dense/kernel
!:2text_cnn/dense/bias
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
trainable_variables
Jmetrics

Klayers
Lnon_trainable_variables
	variables
regularization_losses
Mlayer_regularization_losses
Nlayer_metrics
П__call__
+Р&call_and_return_all_conditional_losses
'Р"call_and_return_conditional_losses"
_generic_user_object
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
.:,мА2text_cnn/conv1d/kernel
#:!А2text_cnn/conv1d/bias
0:.мА2text_cnn/conv1d_1/kernel
%:#А2text_cnn/conv1d_1/bias
0:.мА2text_cnn/conv1d_2/kernel
%:#А2text_cnn/conv1d_2/bias
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
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
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
2trainable_variables
Qmetrics

Rlayers
Snon_trainable_variables
3	variables
4regularization_losses
Tlayer_regularization_losses
Ulayer_metrics
Т__call__
+У&call_and_return_all_conditional_losses
'У"call_and_return_conditional_losses"
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
6trainable_variables
Vmetrics

Wlayers
Xnon_trainable_variables
7	variables
8regularization_losses
Ylayer_regularization_losses
Zlayer_metrics
Ф__call__
+Х&call_and_return_all_conditional_losses
'Х"call_and_return_conditional_losses"
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
:trainable_variables
[metrics

\layers
]non_trainable_variables
;	variables
<regularization_losses
^layer_regularization_losses
_layer_metrics
Ц__call__
+Ч&call_and_return_all_conditional_losses
'Ч"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
░
>trainable_variables
`metrics

alayers
bnon_trainable_variables
?	variables
@regularization_losses
clayer_regularization_losses
dlayer_metrics
Ш__call__
+Щ&call_and_return_all_conditional_losses
'Щ"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
░
Btrainable_variables
emetrics

flayers
gnon_trainable_variables
C	variables
Dregularization_losses
hlayer_regularization_losses
ilayer_metrics
Ъ__call__
+Ы&call_and_return_all_conditional_losses
'Ы"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
░
Ftrainable_variables
jmetrics

klayers
lnon_trainable_variables
G	variables
Hregularization_losses
mlayer_regularization_losses
nlayer_metrics
Ь__call__
+Э&call_and_return_all_conditional_losses
'Э"call_and_return_conditional_losses"
_generic_user_object
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
╗
	ototal
	pcount
q	variables
r	keras_api"Д
_tf_keras_metricj{"class_name": "Mean", "name": "loss", "dtype": "float32", "config": {"name": "loss", "dtype": "float32"}}
 
	stotal
	tcount
u
_fn_kwargs
v	variables
w	keras_api"╕
_tf_keras_metricЭ{"class_name": "MeanMetricWrapper", "name": "accuracy", "dtype": "float32", "config": {"name": "accuracy", "dtype": "float32", "fn": "categorical_accuracy"}}
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
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
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
└>м2$Adam/text_cnn/embedding/embeddings/m
-:+	А2Adam/text_cnn/dense/kernel/m
&:$2Adam/text_cnn/dense/bias/m
3:1мА2Adam/text_cnn/conv1d/kernel/m
(:&А2Adam/text_cnn/conv1d/bias/m
5:3мА2Adam/text_cnn/conv1d_1/kernel/m
*:(А2Adam/text_cnn/conv1d_1/bias/m
5:3мА2Adam/text_cnn/conv1d_2/kernel/m
*:(А2Adam/text_cnn/conv1d_2/bias/m
6:4
└>м2$Adam/text_cnn/embedding/embeddings/v
-:+	А2Adam/text_cnn/dense/kernel/v
&:$2Adam/text_cnn/dense/bias/v
3:1мА2Adam/text_cnn/conv1d/kernel/v
(:&А2Adam/text_cnn/conv1d/bias/v
5:3мА2Adam/text_cnn/conv1d_1/kernel/v
*:(А2Adam/text_cnn/conv1d_1/bias/v
5:3мА2Adam/text_cnn/conv1d_2/kernel/v
*:(А2Adam/text_cnn/conv1d_2/bias/v
▐2█
__inference__wrapped_model_5338╖
Л▓З
FullArgSpec
argsЪ 
varargsjargs
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *'в$
"К
input_1         И'
Ў2є
'__inference_text_cnn_layer_call_fn_5564╟
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *'в$
"К
input_1         И'
С2О
B__inference_text_cnn_layer_call_and_return_conditional_losses_5540╟
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *'в$
"К
input_1         И'
╥2╧
(__inference_embedding_layer_call_fn_5613в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
э2ъ
C__inference_embedding_layer_call_and_return_conditional_losses_5606в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
╬2╦
$__inference_dense_layer_call_fn_5633в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
щ2ц
?__inference_dense_layer_call_and_return_conditional_losses_5624в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
1B/
"__inference_signature_wrapper_5597input_1
°2ї
%__inference_conv1d_layer_call_fn_5365╦
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *+в(
&К#                  м
У2Р
@__inference_conv1d_layer_call_and_return_conditional_losses_5355╦
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *+в(
&К#                  м
·2ў
'__inference_conv1d_1_layer_call_fn_5392╦
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *+в(
&К#                  м
Х2Т
B__inference_conv1d_1_layer_call_and_return_conditional_losses_5382╦
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *+в(
&К#                  м
·2ў
'__inference_conv1d_2_layer_call_fn_5419╦
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *+в(
&К#                  м
Х2Т
B__inference_conv1d_2_layer_call_and_return_conditional_losses_5409╦
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *+в(
&К#                  м
О2Л
3__inference_global_max_pooling1d_layer_call_fn_5432╙
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *3в0
.К+'                           
й2ж
N__inference_global_max_pooling1d_layer_call_and_return_conditional_losses_5426╙
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *3в0
.К+'                           
Р2Н
5__inference_global_max_pooling1d_1_layer_call_fn_5445╙
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *3в0
.К+'                           
л2и
P__inference_global_max_pooling1d_1_layer_call_and_return_conditional_losses_5439╙
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *3в0
.К+'                           
Р2Н
5__inference_global_max_pooling1d_2_layer_call_fn_5458╙
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *3в0
.К+'                           
л2и
P__inference_global_max_pooling1d_2_layer_call_and_return_conditional_losses_5452╙
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *3в0
.К+'                           Ц
__inference__wrapped_model_5338s	"#$%&'1в.
'в$
"К
input_1         И'
к "3к0
.
output_1"К
output_1         ╛
B__inference_conv1d_1_layer_call_and_return_conditional_losses_5382x$%=в:
3в0
.К+
inputs                  м
к "3в0
)К&
0                  А
Ъ Ц
'__inference_conv1d_1_layer_call_fn_5392k$%=в:
3в0
.К+
inputs                  м
к "&К#                  А╛
B__inference_conv1d_2_layer_call_and_return_conditional_losses_5409x&'=в:
3в0
.К+
inputs                  м
к "3в0
)К&
0                  А
Ъ Ц
'__inference_conv1d_2_layer_call_fn_5419k&'=в:
3в0
.К+
inputs                  м
к "&К#                  А╝
@__inference_conv1d_layer_call_and_return_conditional_losses_5355x"#=в:
3в0
.К+
inputs                  м
к "3в0
)К&
0                  А
Ъ Ф
%__inference_conv1d_layer_call_fn_5365k"#=в:
3в0
.К+
inputs                  м
к "&К#                  Аа
?__inference_dense_layer_call_and_return_conditional_losses_5624]0в-
&в#
!К
inputs         А
к "%в"
К
0         
Ъ x
$__inference_dense_layer_call_fn_5633P0в-
&в#
!К
inputs         А
к "К         й
C__inference_embedding_layer_call_and_return_conditional_losses_5606b0в-
&в#
!К
inputs         И'
к "+в(
!К
0         И'м
Ъ Б
(__inference_embedding_layer_call_fn_5613U0в-
&в#
!К
inputs         И'
к "К         И'м╦
P__inference_global_max_pooling1d_1_layer_call_and_return_conditional_losses_5439wEвB
;в8
6К3
inputs'                           
к ".в+
$К!
0                  
Ъ г
5__inference_global_max_pooling1d_1_layer_call_fn_5445jEвB
;в8
6К3
inputs'                           
к "!К                  ╦
P__inference_global_max_pooling1d_2_layer_call_and_return_conditional_losses_5452wEвB
;в8
6К3
inputs'                           
к ".в+
$К!
0                  
Ъ г
5__inference_global_max_pooling1d_2_layer_call_fn_5458jEвB
;в8
6К3
inputs'                           
к "!К                  ╔
N__inference_global_max_pooling1d_layer_call_and_return_conditional_losses_5426wEвB
;в8
6К3
inputs'                           
к ".в+
$К!
0                  
Ъ б
3__inference_global_max_pooling1d_layer_call_fn_5432jEвB
;в8
6К3
inputs'                           
к "!К                  д
"__inference_signature_wrapper_5597~	"#$%&'<в9
в 
2к/
-
input_1"К
input_1         И'"3к0
.
output_1"К
output_1         л
B__inference_text_cnn_layer_call_and_return_conditional_losses_5540e	"#$%&'1в.
'в$
"К
input_1         И'
к "%в"
К
0         
Ъ Г
'__inference_text_cnn_layer_call_fn_5564X	"#$%&'1в.
'в$
"К
input_1         И'
к "К         