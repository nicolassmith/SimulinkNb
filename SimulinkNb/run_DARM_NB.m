%RUN_DARM_NB  Script to run the DARM NoiseBudget demo

%% Path setup

svnDir.anb = '/ligo/svncommon/40mSVN/trunk/NB/aLIGO/';
addpath(genpath([svnDir.anb 'Dev/MatlabTools']));

%% Load parameters, linearize the model, and extract noise terms

disp('Loading parameters for the DARM Simulink model')
DARMParams;
disp('Linearizing and extracting noise terms')
[noises, sys] = nbFromSimulink('DARM', ifoParams.freq);

%% Make a quick NB plot

disp('Plotting noises')
nb = NoiseModel(noises);
nb.unit = 'displacement [m/rtHz]';
nb.sortModel();
matlabNoisePlot(nb);