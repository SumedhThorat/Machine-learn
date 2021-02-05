
clc;
clear all; close all;

%defining training data
male_height=[6;5.92;5.52;5.92];
male_weight=[180;190;170;165];
male_foot=[12;11;12;10];
female_height=[5;5.5;5.42;5.75];
female_weight=[100;150;130;150];
female_foot=[6;8;7;9];

%testing data
x=[6;130;8]

%calculating means
mean_male_height=sum(male_height)/4
mean_male_weight=sum(male_weight)/4
mean_male_foot=sum(male_foot)/4
mean_female_height=sum(female_height)/4
mean_female_weight=sum(female_weight)/4
mean_female_foot=sum(female_foot)/4

%calculating varience
var_male_height=var(male_height)
var_male_weight=var(male_weight)
var_male_foot=var(male_foot)
var_female_height=var(female_height)
var_female_weight=var(female_weight)
var_female_foot=var(female_foot)

%calculating likelihood
p_h_m=(1/sqrt(2*pi*var_male_height))*exp(-((x(1)-mean_male_height)^2)/2*var_male_height)
p_w_m=(1/sqrt(2*pi*var_male_weight)).*exp(-(x(2)-mean_male_weight)^2/(2*var_male_weight))
p_f_m=(1/sqrt(2*pi*var_male_foot))*exp(-((x(3)-mean_male_foot)^2)/2*var_male_foot)
p_h_f=(1/sqrt(2*pi*var_female_height))*exp(-((x(1)-mean_female_height)^2)/2*var_female_height)
p_w_f=(1/sqrt(2*pi*var_female_weight)).*exp(-(x(2)-mean_female_weight)^2/(2*var_female_weight))
p_f_f=(1/sqrt(2*pi*var_female_foot))*exp(-((x(3)-mean_female_foot)^2)/2*var_female_foot)

%evidence
evidence=0.5*(p_h_m*p_w_m*p_f_m)+0.5*(p_h_f*p_w_f*p_f_f);

%posteriors
post_male=((p_h_m*p_w_m*p_f_m)*0.5)/evidence;
post_female=((p_h_f*p_w_f*p_f_f)*0.5)/evidence;

if post_male >post_female
    disp('test sample belog to male')
else 
    disp('test sample belongs to female')
end
