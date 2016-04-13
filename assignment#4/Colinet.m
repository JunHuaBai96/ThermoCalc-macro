function [outputs] = Colinet(xNb, xTi, xV, xZr)
	x1NbNbTi 	= ((1+xNb-xTi) + (1-xNb-xTi))/2;
	x1TiNbTi 	= ((1+xTi-xNb) + (1-xNb-xTi))/2;
	x1NbNbV 	= ((1+xNb-xV) + (1-xNb-xV))/2;
	x1VNbV 		= ((1+xV-xNb) + (1-xNb-xV))/2;
	x1NbNbZr 	= ((1+xNb-xZr) + (1-xNb-xZr))/2;
	x1ZrNbZr 	= ((1+xZr-xNb) + (1-xNb-xZr))/2;
	x1TiTiV 	= ((1+xTi-xV) + (1-xTi-xV))/2;
	x1VTiV 		= ((1+xV-xTi) + (1-xV-xTi))/2;
	x1TiTiZr 	= ((1+xTi-xZr) + (1-xTi-xZr))/2;
	x1ZrTiZr 	= ((1+xZr-xTi) + (1-xZr-xTi))/2;
	x1VVZr 		= ((1+xV-xZr) + (1-xV-xZr))/2;
	x1ZrVZr 	= ((1+xZr-xV) + (1-xZr-xV))/2;

	x2NbNbTi 	= ((1+xNb-xTi) - (1-xNb-xTi))/2;
	x2TiNbTi 	= ((1+xTi-xNb) - (1-xNb-xTi))/2;
	x2NbNbV 	= ((1+xNb-xV) - (1-xNb-xV))/2;
	x2VNbV 		= ((1+xV-xNb) - (1-xNb-xV))/2;
	x2NbNbZr 	= ((1+xNb-xZr) - (1-xNb-xZr))/2;
	x2ZrNbZr 	= ((1+xZr-xNb) - (1-xNb-xZr))/2;
	x2TiTiV 	= ((1+xTi-xV) - (1-xTi-xV))/2;
	x2VTiV 		= ((1+xV-xTi) - (1-xV-xTi))/2;
	x2TiTiZr 	= ((1+xTi-xZr) - (1-xTi-xZr))/2;
	x2ZrTiZr 	= ((1+xZr-xTi) - (1-xZr-xTi))/2;
	x2VVZr 		= ((1+xV-xZr) - (1-xV-xZr))/2;
	x2ZrVZr 	= ((1+xZr-xV) - (1-xZr-xV))/2;

	outputs = ...
	xNb*xTi*NbTi(xNbNbTi, xTiNbTi)./(xNbNbTi*xTiNbTi) ...
	+ xNb.*xV.*NbV(xNbNbV, xVNbV)./(xNbNbV.*xVNbV) ...
	+ xNb.*xZr.*NbZr(xNbNbZr, xZrNbZr)./(xNbNbZr.*xZrNbZr) ...
	+ xTi.*xV.*TiV(xTiTiV, xVTiV)./(xTiTiV.*xVTiV) ...
	+ xTi.*xZr.*TiZr(xTiTiZr, xZrTiZr)./(xTiTiZr.*xZrTiZr) ...
	+ xV.*xZr.*VZr(xVVZr, xZrVZr)./(xVVZr.*xZrVZr);

	outputs = outputs ...
	+ xNb*xTi*NbTi(x2NbNbTi, x2TiNbTi)./(x2NbNbTi*x2TiNbTi) ...
	+ xNb.*xV.*NbV(x2NbNbV, x2VNbV)./(x2NbNbV.*x2VNbV) ...
	+ xNb.*xZr.*NbZr(x2NbNbZr, x2ZrNbZr)./(x2NbNbZr.*x2ZrNbZr) ...
	+ xTi.*xV.*TiV(x2TiTiV, x2VTiV)./(x2TiTiV.*x2VTiV) ...
	+ xTi.*xZr.*TiZr(x2TiTiZr, x2ZrTiZr)./(x2TiTiZr.*x2ZrTiZr) ...
	+ xV.*xZr.*VZr(x2VVZr, x2ZrVZr)./(x2VVZr.*x2ZrVZr);

	outputs = 0.5*outputs;
end