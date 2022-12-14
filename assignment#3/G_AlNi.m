% total Gibbs energy
function [outputs] = G_AlNi(T, y_Al1)
	outputs = G_ref(T, y_Al1) ...
			+ G_conf(T, y_Al1) ...
			+ G_E(T, y_Al1);
end

% reference Gibbs energy
function [outputs] = G_ref(T, y_Al1)
    y_Al2 = 0.8 - y_Al1;
    y_Ni1 = 1.0 - y_Al1;
    y_Ni2 = 1.0 - y_Al2;
	outputs = (y_Al1.*y_Al2).*G_AlNi_AlAl(T) + (y_Al1.*y_Ni2).*G_AlNi_AlNi(T) ...
			+ (y_Ni1.*y_Ni2).*G_AlNi_NiNi(T) + (y_Ni1.*y_Al2).*G_AlNi_NiAl(T);
end

% configurational Gibbs energy
function [outputs] = G_conf(T, y_Al1)
    y_Al2 = 0.8 - y_Al1;
    y_Ni1 = 1.0 - y_Al1;
    y_Ni2 = 1.0 - y_Al2;
	outputs = 8.314*T*0.5*(y_Al1.*log(y_Al1) + y_Ni1.*log(y_Ni1) ...
			+ y_Al2.*log(y_Al2) + y_Ni2.*log(y_Ni2));
end

% excess Gibbs energy
function [outputs] = G_E(T, y_Al1)
    y_Al2 = 0.8 - y_Al1;
    y_Ni1 = 1.0 - y_Al1;
    y_Ni2 = 1.0 - y_Al2;
	outputs = (y_Al1.*y_Ni1).*(y_Al2.*L_AlNiAl(T) + y_Ni2.*L_AlNi_AlNiNi(T, y_Al1)) ...
			+ (y_Al2.*y_Ni2).*(y_Al1.*L_AlAlNi(T) + y_Ni1.*L_AlNi_NiAlNi(y_Al2));
end

% ======================
% Gibbs Energy values for 1st order constitutional arrays
% ======================

% G^AlNi_Al:Al
function [outputs] = G_AlNi_AlAl(T)
	outputs = 10083 - 4.813*T + GHSERAl(T);
end

% G^AlNi_Ni:Ni
function [outputs] = G_AlNi_NiNi(T)
	outputs = 8715.08 - 3.556*T + GHSERNi(T);
end

% G^AlNi_Al:Ni
function [outputs] = G_AlNi_AlNi(T)
	outputs = -56500 - 10.7*T + 1.4975*T*log(T) + 0.5*GHSERAl(T) ...
				+ 0.5*GHSERNi(T);
end

% G^AlNi_Ni:Al
function [outputs] = G_AlNi_NiAl(T)
	outputs = G_AlNi_AlNi(T);
end

% ======================
% L parameters = combining L0 and L1
% ======================

% L^AlNi_Ni:Al,Ni
function [outputs] = L_AlNi_NiAlNi(y_Al2)
    y_Ni2 = 1.0 - y_Al2;
	outputs = L0_AlNi_NiAlNi() + L1_AlNi_NiAlNi()*(y_Al2 - y_Ni2);
end

% L^AlNi_Al,Ni:Ni
function [outputs] = L_AlNi_AlNiNi(T, y_Al1)
    y_Ni1 = 1.0 - y_Al1;
	outputs = L0_AlNi_AlNiNi(T) + L1_AlNi_AlNiNi()*(y_Al1 - y_Ni1);
end

% L^AlNi_Al,Ni:Al
function [outputs] = L_AlNiAl(T)
	outputs = L0_AlNi_AlNiAl(T);
end

% L_Al:Al,Ni
function [outputs] = L_AlAlNi(T)
	outputs = L0_AlNi_AlAlNi(T);
end

% ======================
% L0 parameters
% ======================

% L^0^AlNi_Al,Ni:Al
function [outputs] = L0_AlNi_AlNiAl(T)
	outputs = -14225 - 5.625*T;
end

% L^0^AlNi_Al:Al,Ni
function [outputs] = L0_AlNi_AlAlNi(T)
	outputs = L0_AlNi_AlNiAl(T);
end

% L^0^AlNi_Al,Ni:Ni
function [outputs] = L0_AlNi_AlNiNi(T)
	outputs = L0_AlNi_NiAlNi();
end

% L^0^AlNi_Ni:Al,Ni
function [outputs] = L0_AlNi_NiAlNi()
	outputs = -22050;
end

% ======================
% L1 parameters
% ======================

% L^1^AlNi_Ni:Al,Ni
function [outputs] = L1_AlNi_NiAlNi()
	outputs = 1115;
end

% L^1^AlNi_Al,Ni:Ni
function [outputs] = L1_AlNi_AlNiNi()
	outputs = L1_AlNi_NiAlNi();
end

% ======================
% Standard state Gibbs energy values
% ======================

function [outputs] = GHSERAl(T)
	outputs = -11278.4 + 188.684*T - 31.7482*T*log(T) - 1.231e28*T^-9;
end

function [outputs] = GHSERNi(T)
	outputs = -5179.16 + 117.854*T - 22.096*T*log(T) - 0.0048407*T^2;
end