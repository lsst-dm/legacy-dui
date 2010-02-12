
-- LSST Database Metadata
-- $Revision$
-- $Date$
--
-- See <http://dev.lsstcorp.org/trac/wiki/Copyrights>
-- for copyright information.


DROP DATABASE IF EXISTS lsst_schema_browser_DC3b;
CREATE DATABASE lsst_schema_browser_DC3b;
USE lsst_schema_browser_DC3b;


CREATE TABLE AAA_Version_DC3b_3_1_69 (version CHAR);


CREATE TABLE md_Table (
	tableId INTEGER NOT NULL UNIQUE PRIMARY KEY,
	name VARCHAR(255) NOT NULL UNIQUE,
	engine VARCHAR(255),
	description VARCHAR(255)
);

CREATE TABLE md_Column (
	columnId INTEGER NOT NULL UNIQUE PRIMARY KEY,
	tableId INTEGER NOT NULL REFERENCES md_Table (tableId),
	name VARCHAR(255) NOT NULL,
	description VARCHAR(255),
	type VARCHAR(255),
	notNull INTEGER DEFAULT 0,
	defaultValue VARCHAR(255),
	unit VARCHAR(255),
	ucd VARCHAR(255),
        displayOrder INTEGER NOT NULL,
	INDEX md_Column_idx (tableId, name)
);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 1, name = "CalibSource",
	engine = "MyISAM",
	description = "Table to store all sources detected during WCS determination.&#xA;";

	INSERT INTO md_Column
	SET columnId = 1, tableId = 1, name = "calibSourceId",
		description = "Unique id.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 2, tableId = 1, name = "ccdExposureId",
		description = "Pointer to CcdExposure where this source was measured. Note that we do not allow a source to belong to multiple CcdExposures (it may not span multiple CcdExposures).&#xA;",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 3, tableId = 1, name = "filterId",
		description = "Pointer to an entry in Filter table: filter used to take the Exposure where this Source was measured.&#xA;",
		type = "TINYINT",
		notNull = 0,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 4, tableId = 1, name = "ra",
		description = "RA-coordinate of the center of the calibSource.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 5, tableId = 1, name = "raSigma",
		description = "Uncertainty of ra.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 6, tableId = 1, name = "decl",
		description = "Decl-coordinate of the center of the calibSource.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 7, tableId = 1, name = "declSigma",
		description = "Uncertainty of decl.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 8, tableId = 1, name = "xAstrom",
		description = "x position computed by a centroiding algorithm.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 9, tableId = 1, name = "xAstromSigma",
		description = "Uncertainty of xAstrom.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 10, tableId = 1, name = "yAstrom",
		description = "y position computed by a centroiding algorithm.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 11, tableId = 1, name = "yAstromSigma",
		description = "Uncertainty of yAstrom.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 12, tableId = 1, name = "xyAstromCov",
		description = "Covariance between the xAstrom and the yAstrom.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 13, tableId = 1, name = "psfFlux",
		description = "Psf flux.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 14, tableId = 1, name = "psfFluxSigma",
		description = "Uncertainty of the psfFlux.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 15, tableId = 1, name = "apFlux",
		description = "Aperture flux. Needed for aperture correction calculation.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 16, tableId = 1, name = "apFluxSigma",
		description = "Uncertainty of apFlux.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 17, tableId = 1, name = "momentIxx",
		description = "Adaptive second moment.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 18, tableId = 1, name = "momentIxxSigma",
		description = "Uncertainty of momentIxx: sqrt(covariance(x, x))&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 19, tableId = 1, name = "momentIyy",
		description = "Adaptive second moment.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 19;

	INSERT INTO md_Column
	SET columnId = 20, tableId = 1, name = "momentIyySigma",
		description = "Uncertainty of momentIyy: sqrt(covariance(y, y))&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 20;

	INSERT INTO md_Column
	SET columnId = 21, tableId = 1, name = "momentIxy",
		description = "Adaptive second moment.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 21;

	INSERT INTO md_Column
	SET columnId = 22, tableId = 1, name = "momentIxySigma",
		description = "Uncertainty of momentIxy: sqrt(covariance(x, y))&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 22;

	INSERT INTO md_Column
	SET columnId = 23, tableId = 1, name = "flag",
		description = "Flag for capturing various conditions/statuses.",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 23;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 2, name = "Ccd_Detector";

	INSERT INTO md_Column
	SET columnId = 24, tableId = 2, name = "ccdDetectorId",
		description = "from file name (required for raw science images)",
		type = "INTEGER",
		notNull = 1,
		defaultValue = "1",
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 25, tableId = 2, name = "biasSec",
		description = "Bias section (ex: '[2045:2108,1:4096]')",
		type = "VARCHAR(20)",
		notNull = 1,
		defaultValue = "'[0:0,0:0]'",
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 26, tableId = 2, name = "trimSec",
		description = "Trim section (ex: '[1:2044,1:4096]')",
		type = "VARCHAR(20)",
		notNull = 1,
		defaultValue = "'[0:0,0:0]'",
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 27, tableId = 2, name = "gain",
		description = "Detector/amplifier gain",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 28, tableId = 2, name = "rdNoise",
		description = "Read noise for detector/amplifier",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 29, tableId = 2, name = "saturate",
		description = "Maximum data value for A/D converter",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 6;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 3, name = "DiaSource",
	engine = "MyISAM",
	description = "Table to store high signal-to-noise &quot;sources&quot;. A source is a measurement of  Object's properties from a single image that contains its footprint on the sky.&#xA;";

	INSERT INTO md_Column
	SET columnId = 30, tableId = 3, name = "diaSourceId",
		description = "Unique id.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 31, tableId = 3, name = "ccdExposureId",
		description = "Pointer to the CcdExpsoure where this diaSource was measured. Note that we are allowing a diaSource to belong to multiple AmpExposures, but it may not span multiple CcdExposures.&#xA;",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 32, tableId = 3, name = "filterId",
		description = "Pointer to an entry in Filter table: filter used to take Exposure where this diaSource was measured.&#xA;",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 33, tableId = 3, name = "objectId",
		description = "Pointer to Object table. Might be NULL (each diaSource will point to either MovingObject or Object)&#xA;",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 34, tableId = 3, name = "movingObjectId",
		description = "Pointer to MovingObject table. Might be NULL (each diaSource will point to either MovingObject or Object)&#xA;",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 35, tableId = 3, name = "ra",
		description = "RA-coordinate of the center of the diaSource.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 36, tableId = 3, name = "raSigma",
		description = "Uncertainty of ra.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 37, tableId = 3, name = "decl",
		description = "Decl-coordinate of the center of the diaSource.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 38, tableId = 3, name = "declSigma",
		description = "Uncertainty of decl.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 39, tableId = 3, name = "xAstrom",
		description = "x position computed by a centroiding algorithm for the purposes of astrometry using Dave Monet's algorithm.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 40, tableId = 3, name = "xAstromSigma",
		description = "Uncertainty of xAstrom.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 41, tableId = 3, name = "yAstrom",
		description = "y position computed by a centroiding algorithm for the purposes of astrometry using Dave Monet's algorithm.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 42, tableId = 3, name = "yAstromSigma",
		description = "Uncertainty of yAstrom.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 43, tableId = 3, name = "xyAstromCov",
		description = "Covariance between the xAstrom and the yAstrom.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 44, tableId = 3, name = "xOther",
		description = "x position computed by a centroiding algorithm for the purposes of astrometry using &quot;other&quot; centroiding algorithm.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 45, tableId = 3, name = "xOtherSigma",
		description = "Uncertainty of xOther.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 46, tableId = 3, name = "yOther",
		description = "y position computed by a centroiding algorithm for the purposes of astrometry using &quot;other&quot; centroiding algorithm.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 47, tableId = 3, name = "yOtherSigma",
		description = "Uncertainty of yOther.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 48, tableId = 3, name = "xyOtherCov",
		description = "Covariance between the xOther and yOther.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 19;

	INSERT INTO md_Column
	SET columnId = 49, tableId = 3, name = "sky",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 20;

	INSERT INTO md_Column
	SET columnId = 50, tableId = 3, name = "skySigma",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 21;

	INSERT INTO md_Column
	SET columnId = 51, tableId = 3, name = "psfLnL",
		description = "ln(likelihood) of being a PSF.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 22;

	INSERT INTO md_Column
	SET columnId = 52, tableId = 3, name = "psfFlux",
		description = "PSF flux of the object.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 23;

	INSERT INTO md_Column
	SET columnId = 53, tableId = 3, name = "psfFluxSigma",
		description = "Uncertainty of psfFlux.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 24;

	INSERT INTO md_Column
	SET columnId = 54, tableId = 3, name = "apFlux",
		description = "Aperture flux.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 25;

	INSERT INTO md_Column
	SET columnId = 55, tableId = 3, name = "apFluxSigma",
		description = "Uncertainty of apFlux.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 26;

	INSERT INTO md_Column
	SET columnId = 56, tableId = 3, name = "modelFlux",
		description = "Adaptive 2D gauss model flux.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 27;

	INSERT INTO md_Column
	SET columnId = 57, tableId = 3, name = "modelFluxSigma",
		description = "Uncertainly of modelFlux.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 28;

	INSERT INTO md_Column
	SET columnId = 58, tableId = 3, name = "i",
		description = "Flux in the i band.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 29;

	INSERT INTO md_Column
	SET columnId = 59, tableId = 3, name = "iSigma",
		description = "Uncertainty of i.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 30;

	INSERT INTO md_Column
	SET columnId = 60, tableId = 3, name = "momentIx",
		description = "Adaptive first moment. The moments are primarily for the moving objects, but should carry some information about defects, cosmics, etc. too.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 31;

	INSERT INTO md_Column
	SET columnId = 61, tableId = 3, name = "momentIxSigma",
		description = "Uncertainty of momentIx.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 32;

	INSERT INTO md_Column
	SET columnId = 62, tableId = 3, name = "momentIy",
		description = "Adaptive first moment.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 33;

	INSERT INTO md_Column
	SET columnId = 63, tableId = 3, name = "momentIySigma",
		description = "Uncertainty of momentIy.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 34;

	INSERT INTO md_Column
	SET columnId = 64, tableId = 3, name = "momentIxx",
		description = "Adaptive second moment.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 35;

	INSERT INTO md_Column
	SET columnId = 65, tableId = 3, name = "momentIxxSigma",
		description = "Uncertainty of momentIxx: sqrt(covariance(x, x)).&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 36;

	INSERT INTO md_Column
	SET columnId = 66, tableId = 3, name = "momentIyy",
		description = "Adaptive second moment.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 37;

	INSERT INTO md_Column
	SET columnId = 67, tableId = 3, name = "momentIyySigma",
		description = "Uncertainty of momentIyy: sqrt(covariance(y, y)).&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 38;

	INSERT INTO md_Column
	SET columnId = 68, tableId = 3, name = "momentIxy",
		description = "Adaptive second moment.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 39;

	INSERT INTO md_Column
	SET columnId = 69, tableId = 3, name = "momentIxySigma",
		description = "Uncertainty of momentIxy: sqrt(covariance(x, y)).&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 40;

	INSERT INTO md_Column
	SET columnId = 70, tableId = 3, name = "exposureStartTime",
		description = "Time when the exposure containing this Source was taken (start of the exposure. (tai).&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 41;

	INSERT INTO md_Column
	SET columnId = 71, tableId = 3, name = "flags",
		description = "Flags.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 42;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 4, name = "Filter";

	INSERT INTO md_Column
	SET columnId = 72, tableId = 4, name = "filterId",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 73, tableId = 4, name = "filterName",
		description = "Filter name. Valid values: 'u', 'g', 'r', 'i', 'z', 'y'&#xA;",
		type = "CHAR(255)",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 74, tableId = 4, name = "photClam",
		description = "Filter centroid wavelength",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 75, tableId = 4, name = "photBW",
		description = "System effective bandwidth",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 4;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 5, name = "ForcedDiaSource",
	description = "DiaSources detected through forced photometry (on individual frames).&#xA;";

	INSERT INTO md_Column
	SET columnId = 76, tableId = 5, name = "objectId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 77, tableId = 5, name = "ccdExposureId",
		description = "Pointer to the entry in CcdExposure table where this forcedDiaSource was measured.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 78, tableId = 5, name = "ra",
		description = "RA-coordinate of the center of the forcedDiaSource.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 79, tableId = 5, name = "raSigma",
		description = "Uncertainty of ra.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 80, tableId = 5, name = "decl",
		description = "Decl-coordinate of the center of the forcedDiaSource.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 81, tableId = 5, name = "declSigma",
		description = "Uncertainty of decl.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 82, tableId = 5, name = "sky",
		description = "Sky background.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 83, tableId = 5, name = "skySigma",
		description = "Uncertainty of sky.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 84, tableId = 5, name = "psfFlux",
		description = "Psf flux.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 85, tableId = 5, name = "psfFluxSigma",
		description = "Uncertainty of psf.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 86, tableId = 5, name = "apFlux",
		description = "Aperture flux.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 87, tableId = 5, name = "apFluxSigma",
		description = "Uncertainty of apFlux.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 88, tableId = 5, name = "modelFlux",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 89, tableId = 5, name = "modelFluxSigma",
		description = "Uncertainty of modelFlux.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 90, tableId = 5, name = "modelFluxCanonicalBand",
		description = "It is the flux in this band using  the model from the &quot;canonical band&quot;. This will be specified by a Policy file. RHL would expect it to usually be i, but we  have to be careful for objects that are not detected in that band.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 91, tableId = 5, name = "modelFluxCanonicalBandSigma",
		description = "Uncertainty of modelFluxCanonicalBand.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 92, tableId = 5, name = "psfLnL",
		description = "ln(likelihood) of being a PSF.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 93, tableId = 5, name = "modelLSLnL",
		description = "Log-likelihood of the PointSource model for the exposure where this forcedDiaSource was detected.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 94, tableId = 5, name = "modelSGLnL",
		description = "Log-likelihood of the SmallGalaxy model for the exposure where this forcedDiaSource was detected.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 19;

	INSERT INTO md_Column
	SET columnId = 95, tableId = 5, name = "modelSOLnL",
		description = "Log-likelihood of the SmallObject model for the exposure where this forcedDiaSource was detected.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 20;

	INSERT INTO md_Column
	SET columnId = 96, tableId = 5, name = "modelLOLnL",
		description = "Log-likelihood of the LargeObject model for the exposure where this forcedDiaSource was detected.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 21;

	INSERT INTO md_Column
	SET columnId = 97, tableId = 5, name = "flags",
		description = "Flags.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 22;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 6, name = "ForcedSource",
	description = "Sources detected through forced photometry (on individual frames).&#xA;";

	INSERT INTO md_Column
	SET columnId = 98, tableId = 6, name = "objectId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 99, tableId = 6, name = "ccdExposureId",
		description = "Pointer to the entry in CcdExposure table where this forcedSource was measured.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 100, tableId = 6, name = "ra",
		description = "RA-coordinate of the center of the forcedSource.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 101, tableId = 6, name = "raSigma",
		description = "Uncertainty of ra.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 102, tableId = 6, name = "decl",
		description = "Decl-coordinate of the center of the forcedSource.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 103, tableId = 6, name = "declSigma",
		description = "Uncertainty of decl.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 104, tableId = 6, name = "sky",
		description = "Sky background.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 105, tableId = 6, name = "skySigma",
		description = "Uncertainty of sky.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 106, tableId = 6, name = "psfFlux",
		description = "Psf flux.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 107, tableId = 6, name = "psfFluxSigma",
		description = "Uncertainty of psf.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 108, tableId = 6, name = "apFlux",
		description = "Aperture flux.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 109, tableId = 6, name = "apFluxSigma",
		description = "Uncertainty of apFlux.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 110, tableId = 6, name = "modelFlux",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 111, tableId = 6, name = "modelFluxSigma",
		description = "Uncertainty of modelFlux.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 112, tableId = 6, name = "modelFluxCanonicalBand",
		description = "It is the flux in this band using  the model from the &quot;canonical band&quot;. This will be specified by a Policy file. RHL would expect it to usually be i, but we  have to be careful for objects that are not detected in that band.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 113, tableId = 6, name = "modelFluxCanonicalBandSigma",
		description = "Uncertainty of modelFluxCanonicalBand.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 114, tableId = 6, name = "psfLnL",
		description = "ln(likelihood) of being a PSF.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 115, tableId = 6, name = "modelLSLnL",
		description = "Log-likelihood of the PointSource model for the exposure where this forcedSource was detected.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 116, tableId = 6, name = "modelSGLnL",
		description = "Log-likelihood of the SmallGalaxy model for the exposure where this forcedSource was detected.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 19;

	INSERT INTO md_Column
	SET columnId = 117, tableId = 6, name = "modelSOLnL",
		description = "Log-likelihood of the SmallObject model for the exposure where this forcedSource was detected.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 20;

	INSERT INTO md_Column
	SET columnId = 118, tableId = 6, name = "modelLOLnL",
		description = "Log-likelihood of the LargeObject model for the exposure where this forcedSource was detected.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 21;

	INSERT INTO md_Column
	SET columnId = 119, tableId = 6, name = "flags",
		description = "Flags.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 22;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 7, name = "MovingObject",
	description = "The movingObject table contains description of the Solar System (moving) Objects.&#xA;";

	INSERT INTO md_Column
	SET columnId = 120, tableId = 7, name = "movingObjectId",
		description = "Moving object unique identified.",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 121, tableId = 7, name = "movingObjectVersion",
		description = "Version number for the moving object. Updates to orbital parameters will result in a new version (row) of the object, preserving the orbit refinement history",
		type = "INT",
		notNull = 1,
		defaultValue = "'1'",
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 122, tableId = 7, name = "procHistoryId",
		description = "Pointer to ProcessingHistory table.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 123, tableId = 7, name = "taxonomicTypeId",
		description = "Pointer to ObjectType table for asteroid taxonomic type",
		type = "SMALLINT",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 124, tableId = 7, name = "ssmObjectName",
		description = "MOPS base-64 SSM object name, included for convenience. This name can be obtained from `mops_SSM` by joining on `ssmId`",
		type = "VARCHAR(32)",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 125, tableId = 7, name = "q",
		description = "semi-major axis of the orbit (AU)",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 126, tableId = 7, name = "e",
		description = "eccentricity e (dimensionless)",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 127, tableId = 7, name = "i",
		description = "Inclination of the orbit.",
		type = "DOUBLE",
		notNull = 1,
		unit = "deg",
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 128, tableId = 7, name = "node",
		description = "Longitude of ascending node.",
		type = "DOUBLE",
		notNull = 1,
		unit = "deg",
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 129, tableId = 7, name = "meanAnom",
		description = "Mean anomaly of the orbit",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 130, tableId = 7, name = "argPeri",
		description = "Argument of perihelion.",
		type = "DOUBLE",
		notNull = 1,
		unit = "deg",
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 131, tableId = 7, name = "distPeri",
		description = "perihelion distance (AU)",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 132, tableId = 7, name = "timePeri",
		description = "time of perihelion passage, MJD (UTC)",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 133, tableId = 7, name = "epoch",
		description = "epoch of osculating elements, MJD (UTC)",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 134, tableId = 7, name = "h_v",
		description = "Absolute magnitude",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 135, tableId = 7, name = "g",
		description = "Slope parameter g",
		type = "DOUBLE",
		notNull = 0,
		defaultValue = "0.15",
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 136, tableId = 7, name = "rotationPeriod",
		description = "Rotation period, days",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 137, tableId = 7, name = "rotationEpoch",
		description = "Rotation time origin, MJD (UTC)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 138, tableId = 7, name = "albedo",
		description = "Albedo (dimensionless)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 19;

	INSERT INTO md_Column
	SET columnId = 139, tableId = 7, name = "poleLat",
		description = "Rotation pole latitude (degrees)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 20;

	INSERT INTO md_Column
	SET columnId = 140, tableId = 7, name = "poleLon",
		description = "Rotation pole longitude (degrees)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 21;

	INSERT INTO md_Column
	SET columnId = 141, tableId = 7, name = "d3",
		description = "3-parameter D-criterion (dimensionless) WRT SSM object",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 22;

	INSERT INTO md_Column
	SET columnId = 142, tableId = 7, name = "d4",
		description = "4-parameter D-criterion (dimensionless) WRT SSM object",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 23;

	INSERT INTO md_Column
	SET columnId = 143, tableId = 7, name = "orbFitResidual",
		description = "Orbit fit RMS residual.",
		type = "DOUBLE",
		notNull = 1,
		unit = "argsec",
		displayOrder = 24;

	INSERT INTO md_Column
	SET columnId = 144, tableId = 7, name = "orbFitChi2",
		description = "orbit fit chi-squared statistic",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 25;

	INSERT INTO md_Column
	SET columnId = 145, tableId = 7, name = "classification",
		description = "MOPS efficiency classification ('C'/'M'/'B'/'N'/'X')",
		type = "CHAR(1)",
		notNull = 0,
		displayOrder = 26;

	INSERT INTO md_Column
	SET columnId = 146, tableId = 7, name = "ssmId",
		description = "Source SSM object for C classification",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 27;

	INSERT INTO md_Column
	SET columnId = 147, tableId = 7, name = "mopsStatus",
		description = "NULL, or set to 'M' when DO is merged with parent",
		type = "CHAR(1)",
		notNull = 0,
		displayOrder = 28;

	INSERT INTO md_Column
	SET columnId = 148, tableId = 7, name = "stablePass",
		description = "NULL, or set to 'Y' when stable precovery pass completed",
		type = "CHAR(1)",
		notNull = 0,
		displayOrder = 29;

	INSERT INTO md_Column
	SET columnId = 149, tableId = 7, name = "timeCreated",
		description = "Timestamp for row creation (this is the time of moving object creation for the first version of that object)",
		type = "TIMESTAMP",
		notNull = 0,
		displayOrder = 30;

	INSERT INTO md_Column
	SET columnId = 150, tableId = 7, name = "uMag",
		description = "Weighted average apparent magnitude in u filter.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 31;

	INSERT INTO md_Column
	SET columnId = 151, tableId = 7, name = "uMagErr",
		description = "Uncertainty of uMag.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 32;

	INSERT INTO md_Column
	SET columnId = 152, tableId = 7, name = "uAmplitude",
		description = "Characteristic magnitude scale of the flux variations for u filter",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 33;

	INSERT INTO md_Column
	SET columnId = 153, tableId = 7, name = "uPeriod",
		description = "Period of flux variations (if regular) for u filter",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 34;

	INSERT INTO md_Column
	SET columnId = 154, tableId = 7, name = "gMag",
		description = "Weighted average apparent magnitude in g filter.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 35;

	INSERT INTO md_Column
	SET columnId = 155, tableId = 7, name = "gMagErr",
		description = "Uncertainty of gMag.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 36;

	INSERT INTO md_Column
	SET columnId = 156, tableId = 7, name = "gAmplitude",
		description = "Characteristic magnitude scale of the flux variations for g filter",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 37;

	INSERT INTO md_Column
	SET columnId = 157, tableId = 7, name = "gPeriod",
		description = "Period of flux variations (if regular) for g filter",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 38;

	INSERT INTO md_Column
	SET columnId = 158, tableId = 7, name = "rMag",
		description = "Weighted average apparent magnitude in r filter.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 39;

	INSERT INTO md_Column
	SET columnId = 159, tableId = 7, name = "rMagErr",
		description = "Uncertainty of rMag.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 40;

	INSERT INTO md_Column
	SET columnId = 160, tableId = 7, name = "rAmplitude",
		description = "Characteristic magnitude scale of the flux variations for r filter",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 41;

	INSERT INTO md_Column
	SET columnId = 161, tableId = 7, name = "rPeriod",
		description = "Period of flux variations (if regular) for r filter",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 42;

	INSERT INTO md_Column
	SET columnId = 162, tableId = 7, name = "iMag",
		description = "Weighted average apparent magnitude in i filter.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 43;

	INSERT INTO md_Column
	SET columnId = 163, tableId = 7, name = "iMagErr",
		description = "Uncertainty of iMag.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 44;

	INSERT INTO md_Column
	SET columnId = 164, tableId = 7, name = "iAmplitude",
		description = "Characteristic magnitude scale of the flux variations for i filter",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 45;

	INSERT INTO md_Column
	SET columnId = 165, tableId = 7, name = "iPeriod",
		description = "Period of flux variations (if regular) for i filter",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 46;

	INSERT INTO md_Column
	SET columnId = 166, tableId = 7, name = "zMag",
		description = "Weighted average apparent magnitude in z filter.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 47;

	INSERT INTO md_Column
	SET columnId = 167, tableId = 7, name = "zMagErr",
		description = "Uncertainty of zMag.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 48;

	INSERT INTO md_Column
	SET columnId = 168, tableId = 7, name = "zAmplitude",
		description = "Characteristic magnitude scale of the flux variations for z filter",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 49;

	INSERT INTO md_Column
	SET columnId = 169, tableId = 7, name = "zPeriod",
		description = "Period of flux variations (if regular) for z filter",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 50;

	INSERT INTO md_Column
	SET columnId = 170, tableId = 7, name = "yMag",
		description = "Weighted average apparent magnitude in y filter.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 51;

	INSERT INTO md_Column
	SET columnId = 171, tableId = 7, name = "yMagErr",
		description = "Uncertainty of yMag.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 52;

	INSERT INTO md_Column
	SET columnId = 172, tableId = 7, name = "yAmplitude",
		description = "Characteristic magnitude scale of the flux variations for y filter",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 53;

	INSERT INTO md_Column
	SET columnId = 173, tableId = 7, name = "yPeriod",
		description = "Period of flux variations (if regular) for y filter",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 54;

	INSERT INTO md_Column
	SET columnId = 174, tableId = 7, name = "flag",
		description = "Problem/special condition flag.",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 55;

	INSERT INTO md_Column
	SET columnId = 175, tableId = 7, name = "src01",
		description = "square root of covariance EC EC (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 56;

	INSERT INTO md_Column
	SET columnId = 176, tableId = 7, name = "src02",
		description = "square root of covariance EC QR (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 57;

	INSERT INTO md_Column
	SET columnId = 177, tableId = 7, name = "src03",
		description = "square root of covariance QR QR (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 58;

	INSERT INTO md_Column
	SET columnId = 178, tableId = 7, name = "src04",
		description = "square root of covariance EC TP (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 59;

	INSERT INTO md_Column
	SET columnId = 179, tableId = 7, name = "src05",
		description = "square root of covariance QR TP (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 60;

	INSERT INTO md_Column
	SET columnId = 180, tableId = 7, name = "src06",
		description = "square root of covariance TP TP (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 61;

	INSERT INTO md_Column
	SET columnId = 181, tableId = 7, name = "src07",
		description = "square root of covariance EC OM (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 62;

	INSERT INTO md_Column
	SET columnId = 182, tableId = 7, name = "src08",
		description = "square root of covariance QR OM (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 63;

	INSERT INTO md_Column
	SET columnId = 183, tableId = 7, name = "src09",
		description = "square root of covariance TP OM (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 64;

	INSERT INTO md_Column
	SET columnId = 184, tableId = 7, name = "src10",
		description = "square root of covariance OM OM (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 65;

	INSERT INTO md_Column
	SET columnId = 185, tableId = 7, name = "src11",
		description = "square root of covariance EC W  (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 66;

	INSERT INTO md_Column
	SET columnId = 186, tableId = 7, name = "src12",
		description = "square root of covariance QR W  (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 67;

	INSERT INTO md_Column
	SET columnId = 187, tableId = 7, name = "src13",
		description = "square root of covariance TP W  (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 68;

	INSERT INTO md_Column
	SET columnId = 188, tableId = 7, name = "src14",
		description = "square root of covariance OM W  (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 69;

	INSERT INTO md_Column
	SET columnId = 189, tableId = 7, name = "src15",
		description = "square root of covariance W  W  (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 70;

	INSERT INTO md_Column
	SET columnId = 190, tableId = 7, name = "src16",
		description = "square root of covariance EC IN (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 71;

	INSERT INTO md_Column
	SET columnId = 191, tableId = 7, name = "src17",
		description = "square root of covariance QR IN (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 72;

	INSERT INTO md_Column
	SET columnId = 192, tableId = 7, name = "src18",
		description = "square root of covariance TP IN (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 73;

	INSERT INTO md_Column
	SET columnId = 193, tableId = 7, name = "src19",
		description = "square root of covariance OM IN (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 74;

	INSERT INTO md_Column
	SET columnId = 194, tableId = 7, name = "src20",
		description = "square root of covariance W  IN (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 75;

	INSERT INTO md_Column
	SET columnId = 195, tableId = 7, name = "src21",
		description = "square root of covariance IN IN (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 76;

	INSERT INTO md_Column
	SET columnId = 196, tableId = 7, name = "convCode",
		description = "JPL convergence code",
		type = "VARCHAR(8)",
		notNull = 0,
		displayOrder = 77;

	INSERT INTO md_Column
	SET columnId = 197, tableId = 7, name = "o_minus_c",
		description = "Vestigial observed-computed position, essentially RMS residual",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 78;

	INSERT INTO md_Column
	SET columnId = 198, tableId = 7, name = "moid1",
		description = "Minimum orbital intersection distance (MOID) solution 1",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 79;

	INSERT INTO md_Column
	SET columnId = 199, tableId = 7, name = "moidLong1",
		description = "Longitude of MOID 1",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 80;

	INSERT INTO md_Column
	SET columnId = 200, tableId = 7, name = "moid2",
		description = "Minimum orbital intersection distance (MOID) solution 2",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 81;

	INSERT INTO md_Column
	SET columnId = 201, tableId = 7, name = "moidLong2",
		description = "Longitude of MOID 2",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 82;

	INSERT INTO md_Column
	SET columnId = 202, tableId = 7, name = "arcLengthDays",
		description = "Arc length of detections used to compute orbit",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 83;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 8, name = "Object",
	engine = "MyISAM",
	description = "The Object table contains descriptions of the multi-epoch static astronomical objects, in particular their astrophysical properties as derived from analysis of the &lt;b&gt;Sources &lt;/b&gt;that are associated with them. Note that fast moving objects are not kept here, they are kept in the MovingObject tables.&#xA;&#xA;";

	INSERT INTO md_Column
	SET columnId = 203, tableId = 8, name = "objectId",
		description = "Unique id.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 204, tableId = 8, name = "subChunkId",
		description = "Id of a subChunk this object belongs to. It is a kind of a custom spatial index.&#xA;",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 205, tableId = 8, name = "iauId",
		description = "IAU compliant name for the object. Example: &quot;LSST-DR11 J001234.65-123456.18 GAL&quot;. The last 3 characters identify classification. Note that it will not accommodate multiple classifications.&#xA;",
		type = "CHAR(34)",
		notNull = 0,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 206, tableId = 8, name = "ra_PS",
		description = "RA-coordinate of the center of the object for the Point Source model.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 207, tableId = 8, name = "ra_PS_Sigma",
		description = "Uncertainty of ra_PS.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 208, tableId = 8, name = "decl_PS",
		description = "Dec-coordinate of the center of the object for the Point Source model.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 209, tableId = 8, name = "decl_PS_Sigma",
		description = "Uncertainty of decl_PS.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 210, tableId = 8, name = "radecl_PS_Cov",
		description = "Covariance of ra_PS and decl_PS.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 211, tableId = 8, name = "ra_SG",
		description = "RA-coordinate of the center of the object for the Small Galaxy model.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 212, tableId = 8, name = "ra_SG_Sigma",
		description = "Uncertainty of ra_SG.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 213, tableId = 8, name = "decl_SG",
		description = "Dec-coordinate of the center of the object for the Small Galaxy model.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 214, tableId = 8, name = "decl_SG_Sigma",
		description = "Uncertainty of decl_SG.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 215, tableId = 8, name = "radecl_SG_Cov",
		description = "Covariance of ra_SG and decl_SG.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 216, tableId = 8, name = "raRange",
		description = "Ra part of the bounding box on the sky that fully encloses footprint of this object.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 217, tableId = 8, name = "declRange",
		description = "Decl part of the bounding box on the sky that fully encloses footprint of this object.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 218, tableId = 8, name = "muRa_PS",
		description = "Proper motion (ra) for the Point Source model.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree/year",
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 219, tableId = 8, name = "muRa_PS_Sigma",
		description = "Uncertainty of muRa_PS.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree/year",
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 220, tableId = 8, name = "muDecl_PS",
		description = "Proper motion (decl) for the Point Source model.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree/year",
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 221, tableId = 8, name = "muDecl_PS_Sigma",
		description = "Uncertainty of muDecl_PS.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree/year",
		displayOrder = 19;

	INSERT INTO md_Column
	SET columnId = 222, tableId = 8, name = "muRaDecl_PS_Cov",
		description = "Covariance of muRa_PS and muDecl_PS.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 20;

	INSERT INTO md_Column
	SET columnId = 223, tableId = 8, name = "parallax_PS",
		description = "Parallax for Point Source model.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree/year",
		displayOrder = 21;

	INSERT INTO md_Column
	SET columnId = 224, tableId = 8, name = "parallax_PS_Sigma",
		description = "Uncertainty of parallax_PS.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree/year",
		displayOrder = 22;

	INSERT INTO md_Column
	SET columnId = 225, tableId = 8, name = "cannonicalFilterId",
		description = "Id of the filter which is the cannonical filter for size, ellipticity and Sersic index parameters.&#xA;",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 23;

	INSERT INTO md_Column
	SET columnId = 226, tableId = 8, name = "extendedness",
		description = "Probability that this object is an extended object. Valid range: 0-1, where 1 indicates an extended object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 24;

	INSERT INTO md_Column
	SET columnId = 227, tableId = 8, name = "varProb",
		description = "Probability that this object is variable. Valid range: 0-1, where 1 indicates a variable object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 25;

	INSERT INTO md_Column
	SET columnId = 228, tableId = 8, name = "earliestObsTime",
		description = "Time when this object was observed for the first time.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		unit = "TAI",
		displayOrder = 26;

	INSERT INTO md_Column
	SET columnId = 229, tableId = 8, name = "latestObsTime",
		description = "The latest time when this object was observed.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		unit = "TAI",
		displayOrder = 27;

	INSERT INTO md_Column
	SET columnId = 230, tableId = 8, name = "uNumObs",
		description = "Number of forced sources associated with this object for u filter.&#xA;",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 28;

	INSERT INTO md_Column
	SET columnId = 231, tableId = 8, name = "uExtendedness",
		description = "Probability that this object is an extended object for u filter. Valid range: 0-1, where 1 indicates an extended object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 29;

	INSERT INTO md_Column
	SET columnId = 232, tableId = 8, name = "flags",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 30;

	INSERT INTO md_Column
	SET columnId = 233, tableId = 8, name = "uVarProb",
		description = "Probability that this object is variable for u filter. Valid range: 0-1, where 1 indicates a variable object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 31;

	INSERT INTO md_Column
	SET columnId = 234, tableId = 8, name = "uRaOffset_PS",
		description = "Center correction of ra_PS for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 32;

	INSERT INTO md_Column
	SET columnId = 235, tableId = 8, name = "uRaOffset_PS_Sigma",
		description = "Uncertainty of uRaOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 33;

	INSERT INTO md_Column
	SET columnId = 236, tableId = 8, name = "uDeclOffset_PS",
		description = "Center correction of decl_PS for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 34;

	INSERT INTO md_Column
	SET columnId = 237, tableId = 8, name = "uDeclOffset_PS_Sigma",
		description = "Uncertainty of uDeclOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 35;

	INSERT INTO md_Column
	SET columnId = 238, tableId = 8, name = "uRaDeclOffset_PS_Cov",
		description = "Covariance of uRaOffset_PS and uDeclOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 36;

	INSERT INTO md_Column
	SET columnId = 239, tableId = 8, name = "uRaOffset_SG",
		description = "Center correction of raOffset_SG for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 37;

	INSERT INTO md_Column
	SET columnId = 240, tableId = 8, name = "uRaOffset_SG_Sigma",
		description = "Uncertainty of uRaOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 38;

	INSERT INTO md_Column
	SET columnId = 241, tableId = 8, name = "uDeclOffset_SG",
		description = "Center correction of decl_SG for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 39;

	INSERT INTO md_Column
	SET columnId = 242, tableId = 8, name = "uDeclOffset_SG_Sigma",
		description = "Uncertainty of uDeclOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 40;

	INSERT INTO md_Column
	SET columnId = 243, tableId = 8, name = "uRaDeclOffset_SG_Cov",
		description = "Covariance of uRaOffset_SG and uDeclOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 41;

	INSERT INTO md_Column
	SET columnId = 244, tableId = 8, name = "uLnL_PS",
		description = "Log-likelihood of being a Point Source for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 42;

	INSERT INTO md_Column
	SET columnId = 245, tableId = 8, name = "uLnL_SG",
		description = "Log-likelihood of being a Small Galaxy for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 43;

	INSERT INTO md_Column
	SET columnId = 246, tableId = 8, name = "uFlux_PS",
		description = "Flux for Point Source model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 44;

	INSERT INTO md_Column
	SET columnId = 247, tableId = 8, name = "uFlux_PS_Sigma",
		description = "Uncertainty of uFlux_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 45;

	INSERT INTO md_Column
	SET columnId = 248, tableId = 8, name = "uFlux_SG",
		description = "Flux for Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 46;

	INSERT INTO md_Column
	SET columnId = 249, tableId = 8, name = "uFlux_SG_Sigma",
		description = "Uncertainty of uFlux_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 47;

	INSERT INTO md_Column
	SET columnId = 250, tableId = 8, name = "uFlux_CSG",
		description = "Flux for Cannonical Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 48;

	INSERT INTO md_Column
	SET columnId = 251, tableId = 8, name = "uFlux_CSG_Sigma",
		description = "Uncertainty of uFlux_CSG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 49;

	INSERT INTO md_Column
	SET columnId = 252, tableId = 8, name = "uTimescale",
		description = "Characteristic timescale of flux variations for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "day",
		displayOrder = 50;

	INSERT INTO md_Column
	SET columnId = 253, tableId = 8, name = "uEarliestObsTime",
		description = "Time when this object was observed for the first time in u filter.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 51;

	INSERT INTO md_Column
	SET columnId = 254, tableId = 8, name = "uLatestObsTime",
		description = "The latest time when this object was observed in u filter.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 52;

	INSERT INTO md_Column
	SET columnId = 255, tableId = 8, name = "uSersicN_SG",
		description = "Sersic index for Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 53;

	INSERT INTO md_Column
	SET columnId = 256, tableId = 8, name = "uSersicN_SG_Sigma",
		description = "Uncertainty of uSersicN_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 54;

	INSERT INTO md_Column
	SET columnId = 257, tableId = 8, name = "uE1_SG",
		description = "Ellipticity for Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 55;

	INSERT INTO md_Column
	SET columnId = 258, tableId = 8, name = "uE1_SG_Sigma",
		description = "Uncertainty of uE1_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 56;

	INSERT INTO md_Column
	SET columnId = 259, tableId = 8, name = "uE2_SG",
		description = "Ellipticity for Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 57;

	INSERT INTO md_Column
	SET columnId = 260, tableId = 8, name = "uE2_SG_Sigma",
		description = "Uncertainty of uE2_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 58;

	INSERT INTO md_Column
	SET columnId = 261, tableId = 8, name = "uRadius_SG",
		description = "Size of Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 59;

	INSERT INTO md_Column
	SET columnId = 262, tableId = 8, name = "uRadius_SG_Sigma",
		description = "Uncertainty of uRadius_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 60;

	INSERT INTO md_Column
	SET columnId = 263, tableId = 8, name = "uFlux_ra_PS_Cov",
		description = "Covariance of flux and ra for Point Source model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 61;

	INSERT INTO md_Column
	SET columnId = 264, tableId = 8, name = "uFlux_decl_PS_Cov",
		description = "Covariance of flux and decl for Point Source model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 62;

	INSERT INTO md_Column
	SET columnId = 265, tableId = 8, name = "uRa_decl_PS_Cov",
		description = "Covariance of ra and decl for Point Source model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 63;

	INSERT INTO md_Column
	SET columnId = 266, tableId = 8, name = "uFlux_ra_SG_Cov",
		description = "Covariance of flux and ra for Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 64;

	INSERT INTO md_Column
	SET columnId = 267, tableId = 8, name = "uFlux_decl_SG_Cov",
		description = "Covariance of flux and decl for Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 65;

	INSERT INTO md_Column
	SET columnId = 268, tableId = 8, name = "uFlux_SersicN_SG_Cov",
		description = "Covariance of flux and SersicN for Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 66;

	INSERT INTO md_Column
	SET columnId = 269, tableId = 8, name = "uFlux_e1_SG_Cov",
		description = "Covariance of flux and e1 for Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 67;

	INSERT INTO md_Column
	SET columnId = 270, tableId = 8, name = "uFlux_e2_SG_Cov",
		description = "Covariance of flux and e2 for Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 68;

	INSERT INTO md_Column
	SET columnId = 271, tableId = 8, name = "uFlux_radius_SG_Cov",
		description = "Covariance of flux and radius for Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 69;

	INSERT INTO md_Column
	SET columnId = 272, tableId = 8, name = "uRa_decl_SG_Cov",
		description = "Covariance of ra and decl for Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 70;

	INSERT INTO md_Column
	SET columnId = 273, tableId = 8, name = "uRa_SersicN_SG_Cov",
		description = "Covariance of ra and SersicN for Small Galaxy for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 71;

	INSERT INTO md_Column
	SET columnId = 274, tableId = 8, name = "uRa_e1_SG_Cov",
		description = "Covariance of ra and e1 for Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 72;

	INSERT INTO md_Column
	SET columnId = 275, tableId = 8, name = "uRa_e2_SG_Cov",
		description = "Covariance of ra and e2 for Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 73;

	INSERT INTO md_Column
	SET columnId = 276, tableId = 8, name = "uRa_radius_SG_Cov",
		description = "Covariance of ra and radius for small galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 74;

	INSERT INTO md_Column
	SET columnId = 277, tableId = 8, name = "uDecl_SersicN_SG_Cov",
		description = "Covariance of decl and SersicN for Small Galaxy for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 75;

	INSERT INTO md_Column
	SET columnId = 278, tableId = 8, name = "uDecl_e1_SG_Cov",
		description = "Covariance of decl and e1 for Small Galaxy for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 76;

	INSERT INTO md_Column
	SET columnId = 279, tableId = 8, name = "uDecl_e2_SG_Cov",
		description = "Covariance of decl and e2 for Small Galaxy for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 77;

	INSERT INTO md_Column
	SET columnId = 280, tableId = 8, name = "uDecl_radius_SG_Cov",
		description = "Covariance of decl and radius for Small Galaxy for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 78;

	INSERT INTO md_Column
	SET columnId = 281, tableId = 8, name = "uSersicN_e1_SG_Cov",
		description = "Covariance of SersicN and e1 for Small Galaxy Model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 79;

	INSERT INTO md_Column
	SET columnId = 282, tableId = 8, name = "uSersicN_e2_SG_Cov",
		description = "Covariance of SersicN and e2 for Small Galaxy for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 80;

	INSERT INTO md_Column
	SET columnId = 283, tableId = 8, name = "uSersicN_radius_SG_Cov",
		description = "Covariance of SersicN and radius for Small Galaxy for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 81;

	INSERT INTO md_Column
	SET columnId = 284, tableId = 8, name = "uE1_e2_SG_Cov",
		description = "Covariance of e1 and e2 for Small Galaxy for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 82;

	INSERT INTO md_Column
	SET columnId = 285, tableId = 8, name = "uE1_radius_SG_Cov",
		description = "Covariance of e1 and radius for Small Galaxy for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 83;

	INSERT INTO md_Column
	SET columnId = 286, tableId = 8, name = "uE2_radius_SG_Cov",
		description = "Covariance of e2 and radius for Small Galaxy for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 84;

	INSERT INTO md_Column
	SET columnId = 287, tableId = 8, name = "uFlags",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 85;

	INSERT INTO md_Column
	SET columnId = 288, tableId = 8, name = "gNumObs",
		description = "Number of forced sources associated with this object for g filter.&#xA;",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 86;

	INSERT INTO md_Column
	SET columnId = 289, tableId = 8, name = "gExtendedness",
		description = "Probability that this object is an extended object for g filter. Valid range: 0-1, where 1 indicates an extended object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 87;

	INSERT INTO md_Column
	SET columnId = 290, tableId = 8, name = "gVarProb",
		description = "Probability that this object is variable for g filter. Valid range: 0-1, where 1 indicates a variable object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 88;

	INSERT INTO md_Column
	SET columnId = 291, tableId = 8, name = "gRaOffset_PS",
		description = "Center correction of ga_PS for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 89;

	INSERT INTO md_Column
	SET columnId = 292, tableId = 8, name = "gRaOffset_PS_Sigma",
		description = "Uncertainty of gRaOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 90;

	INSERT INTO md_Column
	SET columnId = 293, tableId = 8, name = "gDeclOffset_PS",
		description = "Center correction of decl_PS for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 91;

	INSERT INTO md_Column
	SET columnId = 294, tableId = 8, name = "gDeclOffset_PS_Sigma",
		description = "Uncertainty of gDeclOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 92;

	INSERT INTO md_Column
	SET columnId = 295, tableId = 8, name = "gRaDeclOffset_PS_Cov",
		description = "Covariance of gRaOffset_PS and gDeclOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 93;

	INSERT INTO md_Column
	SET columnId = 296, tableId = 8, name = "gRaOffset_SG",
		description = "Center correction of gaOffset_SG for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 94;

	INSERT INTO md_Column
	SET columnId = 297, tableId = 8, name = "gRaOffset_SG_Sigma",
		description = "Uncertainty of gRaOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 95;

	INSERT INTO md_Column
	SET columnId = 298, tableId = 8, name = "gDeclOffset_SG",
		description = "Center correction of decl_SG for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 96;

	INSERT INTO md_Column
	SET columnId = 299, tableId = 8, name = "gDeclOffset_SG_Sigma",
		description = "Uncertainty of gDeclOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 97;

	INSERT INTO md_Column
	SET columnId = 300, tableId = 8, name = "gRaDeclOffset_SG_Cov",
		description = "Covariance of gRaOffset_SG and gDeclOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 98;

	INSERT INTO md_Column
	SET columnId = 301, tableId = 8, name = "gLnL_PS",
		description = "Log-likelihood of being a Point Source for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 99;

	INSERT INTO md_Column
	SET columnId = 302, tableId = 8, name = "gLnL_SG",
		description = "Log-likelihood of being a Small Galaxy for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 100;

	INSERT INTO md_Column
	SET columnId = 303, tableId = 8, name = "gFlux_PS",
		description = "Flux for Point Source model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 101;

	INSERT INTO md_Column
	SET columnId = 304, tableId = 8, name = "gFlux_PS_Sigma",
		description = "Uncertainty of gFlux_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 102;

	INSERT INTO md_Column
	SET columnId = 305, tableId = 8, name = "gFlux_SG",
		description = "Flux for Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 103;

	INSERT INTO md_Column
	SET columnId = 306, tableId = 8, name = "gFlux_SG_Sigma",
		description = "Uncertainty of gFlux_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 104;

	INSERT INTO md_Column
	SET columnId = 307, tableId = 8, name = "gFlux_CSG",
		description = "Flux for Cannonical Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 105;

	INSERT INTO md_Column
	SET columnId = 308, tableId = 8, name = "gFlux_CSG_Sigma",
		description = "Uncertainty of gFlux_CSG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 106;

	INSERT INTO md_Column
	SET columnId = 309, tableId = 8, name = "gTimescale",
		description = "Characteristic timescale of flux variations for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "day",
		displayOrder = 107;

	INSERT INTO md_Column
	SET columnId = 310, tableId = 8, name = "gEarliestObsTime",
		description = "Time when this object was observed for the first time in g filter.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 108;

	INSERT INTO md_Column
	SET columnId = 311, tableId = 8, name = "gLatestObsTime",
		description = "The latest time when this object was observed in g filter.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 109;

	INSERT INTO md_Column
	SET columnId = 312, tableId = 8, name = "gSersicN_SG",
		description = "Sersic index for Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 110;

	INSERT INTO md_Column
	SET columnId = 313, tableId = 8, name = "gSersicN_SG_Sigma",
		description = "Uncertainty of gSersicN_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 111;

	INSERT INTO md_Column
	SET columnId = 314, tableId = 8, name = "gE1_SG",
		description = "Ellipticity for Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 112;

	INSERT INTO md_Column
	SET columnId = 315, tableId = 8, name = "gE1_SG_Sigma",
		description = "Uncertainty of gE1_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 113;

	INSERT INTO md_Column
	SET columnId = 316, tableId = 8, name = "gE2_SG",
		description = "Ellipticity for Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 114;

	INSERT INTO md_Column
	SET columnId = 317, tableId = 8, name = "gE2_SG_Sigma",
		description = "Uncertainty of gE2_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 115;

	INSERT INTO md_Column
	SET columnId = 318, tableId = 8, name = "gRadius_SG",
		description = "Size of Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 116;

	INSERT INTO md_Column
	SET columnId = 319, tableId = 8, name = "gRadius_SG_Sigma",
		description = "Uncertainty of gRadius_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 117;

	INSERT INTO md_Column
	SET columnId = 320, tableId = 8, name = "gFlux_ra_PS_Cov",
		description = "Covariance of flux and ra for Point Source model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 118;

	INSERT INTO md_Column
	SET columnId = 321, tableId = 8, name = "gFlux_decl_PS_Cov",
		description = "Covariance of flux and decl for Point Source model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 119;

	INSERT INTO md_Column
	SET columnId = 322, tableId = 8, name = "gRa_decl_PS_Cov",
		description = "Covariance of ga and decl for Point Source model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 120;

	INSERT INTO md_Column
	SET columnId = 323, tableId = 8, name = "gFlux_ra_SG_Cov",
		description = "Covariance of flux and ra for Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 121;

	INSERT INTO md_Column
	SET columnId = 324, tableId = 8, name = "gFlux_decl_SG_Cov",
		description = "Covariance of flux and decl for Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 122;

	INSERT INTO md_Column
	SET columnId = 325, tableId = 8, name = "gFlux_SersicN_SG_Cov",
		description = "Covariance of flux and SersicN for Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 123;

	INSERT INTO md_Column
	SET columnId = 326, tableId = 8, name = "gFlux_e1_SG_Cov",
		description = "Covariance of flux and e1 for Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 124;

	INSERT INTO md_Column
	SET columnId = 327, tableId = 8, name = "gFlux_e2_SG_Cov",
		description = "Covariance of flux and e2 for Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 125;

	INSERT INTO md_Column
	SET columnId = 328, tableId = 8, name = "gFlux_radius_SG_Cov",
		description = "Covariance of flux and radius for Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 126;

	INSERT INTO md_Column
	SET columnId = 329, tableId = 8, name = "gRa_decl_SG_Cov",
		description = "Covariance of ga and decl for Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 127;

	INSERT INTO md_Column
	SET columnId = 330, tableId = 8, name = "gRa_SersicN_SG_Cov",
		description = "Covariance of ga and SersicN for Small Galaxy for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 128;

	INSERT INTO md_Column
	SET columnId = 331, tableId = 8, name = "rNumObs",
		description = "Number of forced sources associated with this object for r filter.&#xA;",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 129;

	INSERT INTO md_Column
	SET columnId = 332, tableId = 8, name = "gRa_e1_SG_Cov",
		description = "Covariance of ga and e1 for Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 130;

	INSERT INTO md_Column
	SET columnId = 333, tableId = 8, name = "rExtendedness",
		description = "Probability that this object is an extended object for r filter. Valid range: 0-1, where 1 indicates an extended object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 131;

	INSERT INTO md_Column
	SET columnId = 334, tableId = 8, name = "gRa_e2_SG_Cov",
		description = "Covariance of ga and e2 for Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 132;

	INSERT INTO md_Column
	SET columnId = 335, tableId = 8, name = "rVarProb",
		description = "Probability that this object is variable for r filter. Valid range: 0-1, where 1 indicates a variable object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 133;

	INSERT INTO md_Column
	SET columnId = 336, tableId = 8, name = "gRa_radius_SG_Cov",
		description = "Covariance of ga and radius for small galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 134;

	INSERT INTO md_Column
	SET columnId = 337, tableId = 8, name = "rRaOffset_PS",
		description = "Center correction of ra_PS for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 135;

	INSERT INTO md_Column
	SET columnId = 338, tableId = 8, name = "gDecl_SersicN_SG_Cov",
		description = "Covariance of decl and SersicN for Small Galaxy for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 136;

	INSERT INTO md_Column
	SET columnId = 339, tableId = 8, name = "rRaOffset_PS_Sigma",
		description = "Uncertainty of rRaOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 137;

	INSERT INTO md_Column
	SET columnId = 340, tableId = 8, name = "gDecl_e1_SG_Cov",
		description = "Covariance of decl and e1 for Small Galaxy for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 138;

	INSERT INTO md_Column
	SET columnId = 341, tableId = 8, name = "rDeclOffset_PS",
		description = "Center correction of decl_PS for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 139;

	INSERT INTO md_Column
	SET columnId = 342, tableId = 8, name = "gDecl_e2_SG_Cov",
		description = "Covariance of decl and e2 for Small Galaxy for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 140;

	INSERT INTO md_Column
	SET columnId = 343, tableId = 8, name = "rDeclOffset_PS_Sigma",
		description = "Uncertainty of rDeclOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 141;

	INSERT INTO md_Column
	SET columnId = 344, tableId = 8, name = "gDecl_radius_SG_Cov",
		description = "Covariance of decl and radius for Small Galaxy for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 142;

	INSERT INTO md_Column
	SET columnId = 345, tableId = 8, name = "rRaDeclOffset_PS_Cov",
		description = "Covariance of rRaOffset_PS and gDeclOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 143;

	INSERT INTO md_Column
	SET columnId = 346, tableId = 8, name = "gSersicN_e1_SG_Cov",
		description = "Covariance of SersicN and e1 for Small Galaxy Model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 144;

	INSERT INTO md_Column
	SET columnId = 347, tableId = 8, name = "rRaOffset_SG",
		description = "Center correction of raOffset_SG for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 145;

	INSERT INTO md_Column
	SET columnId = 348, tableId = 8, name = "gSersicN_e2_SG_Cov",
		description = "Covariance of SersicN and e2 for Small Galaxy for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 146;

	INSERT INTO md_Column
	SET columnId = 349, tableId = 8, name = "rRaOffset_SG_Sigma",
		description = "Uncertainty of rRaOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 147;

	INSERT INTO md_Column
	SET columnId = 350, tableId = 8, name = "gSersicN_radius_SG_Cov",
		description = "Covariance of SersicN and radius for Small Galaxy for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 148;

	INSERT INTO md_Column
	SET columnId = 351, tableId = 8, name = "rDeclOffset_SG",
		description = "Center correction of decl_SG for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 149;

	INSERT INTO md_Column
	SET columnId = 352, tableId = 8, name = "gE1_e2_SG_Cov",
		description = "Covariance of e1 and e2 for Small Galaxy for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 150;

	INSERT INTO md_Column
	SET columnId = 353, tableId = 8, name = "rDeclOffset_SG_Sigma",
		description = "Uncertainty of rDeclOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 151;

	INSERT INTO md_Column
	SET columnId = 354, tableId = 8, name = "gE1_radius_SG_Cov",
		description = "Covariance of e1 and radius for Small Galaxy for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 152;

	INSERT INTO md_Column
	SET columnId = 355, tableId = 8, name = "rRaDeclOffset_SG_Cov",
		description = "Covariance of rRaOffset_SG and gDeclOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 153;

	INSERT INTO md_Column
	SET columnId = 356, tableId = 8, name = "gE2_radius_SG_Cov",
		description = "Covariance of e2 and radius for Small Galaxy for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 154;

	INSERT INTO md_Column
	SET columnId = 357, tableId = 8, name = "rLnL_PS",
		description = "Log-likelihood of being a Point Source for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 155;

	INSERT INTO md_Column
	SET columnId = 358, tableId = 8, name = "gFlags",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 156;

	INSERT INTO md_Column
	SET columnId = 359, tableId = 8, name = "rLnL_SG",
		description = "Log-likelihood of being a Small Galaxy for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 157;

	INSERT INTO md_Column
	SET columnId = 360, tableId = 8, name = "rFlux_PS",
		description = "Flux for Point Source model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 158;

	INSERT INTO md_Column
	SET columnId = 361, tableId = 8, name = "rFlux_PS_Sigma",
		description = "Uncertainty of rFlux_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 159;

	INSERT INTO md_Column
	SET columnId = 362, tableId = 8, name = "rFlux_SG",
		description = "Flux for Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 160;

	INSERT INTO md_Column
	SET columnId = 363, tableId = 8, name = "rFlux_SG_Sigma",
		description = "Uncertainty of rFlux_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 161;

	INSERT INTO md_Column
	SET columnId = 364, tableId = 8, name = "rFlux_CSG",
		description = "Flux for Cannonical Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 162;

	INSERT INTO md_Column
	SET columnId = 365, tableId = 8, name = "rFlux_CSG_Sigma",
		description = "Uncertainty of rFlux_CSG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 163;

	INSERT INTO md_Column
	SET columnId = 366, tableId = 8, name = "rTimescale",
		description = "Characteristic timescale of flux variations for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "day",
		displayOrder = 164;

	INSERT INTO md_Column
	SET columnId = 367, tableId = 8, name = "rEarliestObsTime",
		description = "Time when this object was observed for the first time in g filter.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 165;

	INSERT INTO md_Column
	SET columnId = 368, tableId = 8, name = "rLatestObsTime",
		description = "The latest time when this object was observed in g filter.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 166;

	INSERT INTO md_Column
	SET columnId = 369, tableId = 8, name = "rSersicN_SG",
		description = "Sersic index for Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 167;

	INSERT INTO md_Column
	SET columnId = 370, tableId = 8, name = "rSersicN_SG_Sigma",
		description = "Uncertainty of rSersicN_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 168;

	INSERT INTO md_Column
	SET columnId = 371, tableId = 8, name = "rE1_SG",
		description = "Ellipticity for Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 169;

	INSERT INTO md_Column
	SET columnId = 372, tableId = 8, name = "rE1_SG_Sigma",
		description = "Uncertainty of rE1_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 170;

	INSERT INTO md_Column
	SET columnId = 373, tableId = 8, name = "rE2_SG",
		description = "Ellipticity for Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 171;

	INSERT INTO md_Column
	SET columnId = 374, tableId = 8, name = "rE2_SG_Sigma",
		description = "Uncertainty of rE2_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 172;

	INSERT INTO md_Column
	SET columnId = 375, tableId = 8, name = "rRadius_SG",
		description = "Size of Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 173;

	INSERT INTO md_Column
	SET columnId = 376, tableId = 8, name = "rRadius_SG_Sigma",
		description = "Uncertainty of rRadius_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 174;

	INSERT INTO md_Column
	SET columnId = 377, tableId = 8, name = "rFlux_ra_PS_Cov",
		description = "Covariance of flux and ra for Point Source model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 175;

	INSERT INTO md_Column
	SET columnId = 378, tableId = 8, name = "rFlux_decl_PS_Cov",
		description = "Covariance of flux and decl for Point Source model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 176;

	INSERT INTO md_Column
	SET columnId = 379, tableId = 8, name = "rRa_decl_PS_Cov",
		description = "Covariance of ra and decl for Point Source model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 177;

	INSERT INTO md_Column
	SET columnId = 380, tableId = 8, name = "rFlux_ra_SG_Cov",
		description = "Covariance of flux and ra for Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 178;

	INSERT INTO md_Column
	SET columnId = 381, tableId = 8, name = "rFlux_decl_SG_Cov",
		description = "Covariance of flux and decl for Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 179;

	INSERT INTO md_Column
	SET columnId = 382, tableId = 8, name = "rFlux_SersicN_SG_Cov",
		description = "Covariance of flux and SersicN for Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 180;

	INSERT INTO md_Column
	SET columnId = 383, tableId = 8, name = "rFlux_e1_SG_Cov",
		description = "Covariance of flux and e1 for Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 181;

	INSERT INTO md_Column
	SET columnId = 384, tableId = 8, name = "rFlux_e2_SG_Cov",
		description = "Covariance of flux and e2 for Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 182;

	INSERT INTO md_Column
	SET columnId = 385, tableId = 8, name = "rFlux_radius_SG_Cov",
		description = "Covariance of flux and radius for Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 183;

	INSERT INTO md_Column
	SET columnId = 386, tableId = 8, name = "rRa_decl_SG_Cov",
		description = "Covariance of ra and decl for Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 184;

	INSERT INTO md_Column
	SET columnId = 387, tableId = 8, name = "rRa_SersicN_SG_Cov",
		description = "Covariance of ra and SersicN for Small Galaxy for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 185;

	INSERT INTO md_Column
	SET columnId = 388, tableId = 8, name = "rRa_e1_SG_Cov",
		description = "Covariance of ra and e1 for Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 186;

	INSERT INTO md_Column
	SET columnId = 389, tableId = 8, name = "rRa_e2_SG_Cov",
		description = "Covariance of ra and e2 for Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 187;

	INSERT INTO md_Column
	SET columnId = 390, tableId = 8, name = "rRa_radius_SG_Cov",
		description = "Covariance of ra and radius for small galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 188;

	INSERT INTO md_Column
	SET columnId = 391, tableId = 8, name = "rDecl_SersicN_SG_Cov",
		description = "Covariance of decl and SersicN for Small Galaxy for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 189;

	INSERT INTO md_Column
	SET columnId = 392, tableId = 8, name = "rDecl_e1_SG_Cov",
		description = "Covariance of decl and e1 for Small Galaxy for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 190;

	INSERT INTO md_Column
	SET columnId = 393, tableId = 8, name = "rDecl_e2_SG_Cov",
		description = "Covariance of decl and e2 for Small Galaxy for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 191;

	INSERT INTO md_Column
	SET columnId = 394, tableId = 8, name = "rDecl_radius_SG_Cov",
		description = "Covariance of decl and radius for Small Galaxy for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 192;

	INSERT INTO md_Column
	SET columnId = 395, tableId = 8, name = "rSersicN_e1_SG_Cov",
		description = "Covariance of SersicN and e1 for Small Galaxy Model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 193;

	INSERT INTO md_Column
	SET columnId = 396, tableId = 8, name = "rSersicN_e2_SG_Cov",
		description = "Covariance of SersicN and e2 for Small Galaxy for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 194;

	INSERT INTO md_Column
	SET columnId = 397, tableId = 8, name = "rSersicN_radius_SG_Cov",
		description = "Covariance of SersicN and radius for Small Galaxy for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 195;

	INSERT INTO md_Column
	SET columnId = 398, tableId = 8, name = "rE1_e2_SG_Cov",
		description = "Covariance of e1 and e2 for Small Galaxy for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 196;

	INSERT INTO md_Column
	SET columnId = 399, tableId = 8, name = "rE1_radius_SG_Cov",
		description = "Covariance of e1 and radius for Small Galaxy for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 197;

	INSERT INTO md_Column
	SET columnId = 400, tableId = 8, name = "rE2_radius_SG_Cov",
		description = "Covariance of e2 and radius for Small Galaxy for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 198;

	INSERT INTO md_Column
	SET columnId = 401, tableId = 8, name = "rFlags",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 199;

	INSERT INTO md_Column
	SET columnId = 402, tableId = 8, name = "iNumObs",
		description = "Number of forced sources associated with this object for i filter.&#xA;",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 200;

	INSERT INTO md_Column
	SET columnId = 403, tableId = 8, name = "iExtendedness",
		description = "Probability that this object is an extended object for i filter. Valid range: 0-1, where 1 indicates an extended object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 201;

	INSERT INTO md_Column
	SET columnId = 404, tableId = 8, name = "iVarProb",
		description = "Probability that this object is variable for i filter. Valid range: 0-1, where 1 indicates a variable object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 202;

	INSERT INTO md_Column
	SET columnId = 405, tableId = 8, name = "iRaOffset_PS",
		description = "Center correction of ia_PS for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 203;

	INSERT INTO md_Column
	SET columnId = 406, tableId = 8, name = "iRaOffset_PS_Sigma",
		description = "Uncertainty of iRaOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 204;

	INSERT INTO md_Column
	SET columnId = 407, tableId = 8, name = "iDeclOffset_PS",
		description = "Center correction of decl_PS for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 205;

	INSERT INTO md_Column
	SET columnId = 408, tableId = 8, name = "iDeclOffset_PS_Sigma",
		description = "Uncertainty of iDeclOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 206;

	INSERT INTO md_Column
	SET columnId = 409, tableId = 8, name = "iRaDeclOffset_PS_Cov",
		description = "Covariance of iRaOffset_PS and gDeclOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 207;

	INSERT INTO md_Column
	SET columnId = 410, tableId = 8, name = "iRaOffset_SG",
		description = "Center correction of iaOffset_SG for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 208;

	INSERT INTO md_Column
	SET columnId = 411, tableId = 8, name = "iRaOffset_SG_Sigma",
		description = "Uncertainty of iRaOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 209;

	INSERT INTO md_Column
	SET columnId = 412, tableId = 8, name = "iDeclOffset_SG",
		description = "Center correction of decl_SG for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 210;

	INSERT INTO md_Column
	SET columnId = 413, tableId = 8, name = "iDeclOffset_SG_Sigma",
		description = "Uncertainty of iDeclOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 211;

	INSERT INTO md_Column
	SET columnId = 414, tableId = 8, name = "iRaDeclOffset_SG_Cov",
		description = "Covariance of iRaOffset_SG and gDeclOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 212;

	INSERT INTO md_Column
	SET columnId = 415, tableId = 8, name = "iLnL_PS",
		description = "Log-likelihood of being a Point Source for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 213;

	INSERT INTO md_Column
	SET columnId = 416, tableId = 8, name = "iLnL_SG",
		description = "Log-likelihood of being a Small Galaxy for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 214;

	INSERT INTO md_Column
	SET columnId = 417, tableId = 8, name = "iFlux_PS",
		description = "Flux for Point Source model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 215;

	INSERT INTO md_Column
	SET columnId = 418, tableId = 8, name = "iFlux_PS_Sigma",
		description = "Uncertainty of iFlux_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 216;

	INSERT INTO md_Column
	SET columnId = 419, tableId = 8, name = "iFlux_SG",
		description = "Flux for Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 217;

	INSERT INTO md_Column
	SET columnId = 420, tableId = 8, name = "iFlux_SG_Sigma",
		description = "Uncertainty of iFlux_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 218;

	INSERT INTO md_Column
	SET columnId = 421, tableId = 8, name = "iFlux_CSG",
		description = "Flux for Cannonical Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 219;

	INSERT INTO md_Column
	SET columnId = 422, tableId = 8, name = "iFlux_CSG_Sigma",
		description = "Uncertainty of iFlux_CSG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 220;

	INSERT INTO md_Column
	SET columnId = 423, tableId = 8, name = "iTimescale",
		description = "Characteristic timescale of flux variations for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "day",
		displayOrder = 221;

	INSERT INTO md_Column
	SET columnId = 424, tableId = 8, name = "iEarliestObsTime",
		description = "Time when this object was observed for the first time in g filter.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 222;

	INSERT INTO md_Column
	SET columnId = 425, tableId = 8, name = "iLatestObsTime",
		description = "The latest time when this object was observed in g filter.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 223;

	INSERT INTO md_Column
	SET columnId = 426, tableId = 8, name = "iSersicN_SG",
		description = "Sersic index for Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 224;

	INSERT INTO md_Column
	SET columnId = 427, tableId = 8, name = "iSersicN_SG_Sigma",
		description = "Uncertainty of iSersicN_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 225;

	INSERT INTO md_Column
	SET columnId = 428, tableId = 8, name = "iE1_SG",
		description = "Ellipticity for Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 226;

	INSERT INTO md_Column
	SET columnId = 429, tableId = 8, name = "iE1_SG_Sigma",
		description = "Uncertainty of iE1_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 227;

	INSERT INTO md_Column
	SET columnId = 430, tableId = 8, name = "iE2_SG",
		description = "Ellipticity for Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 228;

	INSERT INTO md_Column
	SET columnId = 431, tableId = 8, name = "iE2_SG_Sigma",
		description = "Uncertainty of iE2_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 229;

	INSERT INTO md_Column
	SET columnId = 432, tableId = 8, name = "iRadius_SG",
		description = "Size of Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 230;

	INSERT INTO md_Column
	SET columnId = 433, tableId = 8, name = "iRadius_SG_Sigma",
		description = "Uncertainty of iRadius_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 231;

	INSERT INTO md_Column
	SET columnId = 434, tableId = 8, name = "iFlux_ra_PS_Cov",
		description = "Covariance of flux and ra for Point Source model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 232;

	INSERT INTO md_Column
	SET columnId = 435, tableId = 8, name = "iFlux_decl_PS_Cov",
		description = "Covariance of flux and decl for Point Source model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 233;

	INSERT INTO md_Column
	SET columnId = 436, tableId = 8, name = "iRa_decl_PS_Cov",
		description = "Covariance of ia and decl for Point Source model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 234;

	INSERT INTO md_Column
	SET columnId = 437, tableId = 8, name = "iFlux_ra_SG_Cov",
		description = "Covariance of flux and ra for Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 235;

	INSERT INTO md_Column
	SET columnId = 438, tableId = 8, name = "iFlux_decl_SG_Cov",
		description = "Covariance of flux and decl for Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 236;

	INSERT INTO md_Column
	SET columnId = 439, tableId = 8, name = "iFlux_SersicN_SG_Cov",
		description = "Covariance of flux and SersicN for Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 237;

	INSERT INTO md_Column
	SET columnId = 440, tableId = 8, name = "iFlux_e1_SG_Cov",
		description = "Covariance of flux and e1 for Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 238;

	INSERT INTO md_Column
	SET columnId = 441, tableId = 8, name = "iFlux_e2_SG_Cov",
		description = "Covariance of flux and e2 for Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 239;

	INSERT INTO md_Column
	SET columnId = 442, tableId = 8, name = "iFlux_radius_SG_Cov",
		description = "Covariance of flux and radius for Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 240;

	INSERT INTO md_Column
	SET columnId = 443, tableId = 8, name = "iRa_decl_SG_Cov",
		description = "Covariance of ia and decl for Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 241;

	INSERT INTO md_Column
	SET columnId = 444, tableId = 8, name = "iRa_SersicN_SG_Cov",
		description = "Covariance of ia and SersicN for Small Galaxy for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 242;

	INSERT INTO md_Column
	SET columnId = 445, tableId = 8, name = "iRa_e1_SG_Cov",
		description = "Covariance of ia and e1 for Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 243;

	INSERT INTO md_Column
	SET columnId = 446, tableId = 8, name = "iRa_e2_SG_Cov",
		description = "Covariance of ia and e2 for Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 244;

	INSERT INTO md_Column
	SET columnId = 447, tableId = 8, name = "iRa_radius_SG_Cov",
		description = "Covariance of ia and radius for small galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 245;

	INSERT INTO md_Column
	SET columnId = 448, tableId = 8, name = "iDecl_SersicN_SG_Cov",
		description = "Covariance of decl and SersicN for Small Galaxy for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 246;

	INSERT INTO md_Column
	SET columnId = 449, tableId = 8, name = "iDecl_e1_SG_Cov",
		description = "Covariance of decl and e1 for Small Galaxy for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 247;

	INSERT INTO md_Column
	SET columnId = 450, tableId = 8, name = "iDecl_e2_SG_Cov",
		description = "Covariance of decl and e2 for Small Galaxy for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 248;

	INSERT INTO md_Column
	SET columnId = 451, tableId = 8, name = "iDecl_radius_SG_Cov",
		description = "Covariance of decl and radius for Small Galaxy for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 249;

	INSERT INTO md_Column
	SET columnId = 452, tableId = 8, name = "iSersicN_e1_SG_Cov",
		description = "Covariance of SersicN and e1 for Small Galaxy Model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 250;

	INSERT INTO md_Column
	SET columnId = 453, tableId = 8, name = "iSersicN_e2_SG_Cov",
		description = "Covariance of SersicN and e2 for Small Galaxy for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 251;

	INSERT INTO md_Column
	SET columnId = 454, tableId = 8, name = "iSersicN_radius_SG_Cov",
		description = "Covariance of SersicN and radius for Small Galaxy for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 252;

	INSERT INTO md_Column
	SET columnId = 455, tableId = 8, name = "iE1_e2_SG_Cov",
		description = "Covariance of e1 and e2 for Small Galaxy for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 253;

	INSERT INTO md_Column
	SET columnId = 456, tableId = 8, name = "iE1_radius_SG_Cov",
		description = "Covariance of e1 and radius for Small Galaxy for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 254;

	INSERT INTO md_Column
	SET columnId = 457, tableId = 8, name = "iE2_radius_SG_Cov",
		description = "Covariance of e2 and radius for Small Galaxy for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 255;

	INSERT INTO md_Column
	SET columnId = 458, tableId = 8, name = "iFlags",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 256;

	INSERT INTO md_Column
	SET columnId = 459, tableId = 8, name = "zNumObs",
		description = "Number of forced sources associated with this object for z filter.&#xA;",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 257;

	INSERT INTO md_Column
	SET columnId = 460, tableId = 8, name = "zExtendedness",
		description = "Probability that this object is an extended object for z filter. Valid range: 0-1, where 1 indicates an extended object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 258;

	INSERT INTO md_Column
	SET columnId = 461, tableId = 8, name = "zVarProb",
		description = "Probability that this object is variable for z filter. Valid range: 0-1, where 1 indicates a variable object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 259;

	INSERT INTO md_Column
	SET columnId = 462, tableId = 8, name = "zRaOffset_PS",
		description = "Center correction of za_PS for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 260;

	INSERT INTO md_Column
	SET columnId = 463, tableId = 8, name = "zRaOffset_PS_Sigma",
		description = "Uncertainty of zRaOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 261;

	INSERT INTO md_Column
	SET columnId = 464, tableId = 8, name = "zDeclOffset_PS",
		description = "Center correction of decl_PS for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 262;

	INSERT INTO md_Column
	SET columnId = 465, tableId = 8, name = "zDeclOffset_PS_Sigma",
		description = "Uncertainty of zDeclOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 263;

	INSERT INTO md_Column
	SET columnId = 466, tableId = 8, name = "zRaDeclOffset_PS_Cov",
		description = "Covariance of zRaOffset_PS and gDeclOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 264;

	INSERT INTO md_Column
	SET columnId = 467, tableId = 8, name = "zRaOffset_SG",
		description = "Center correction of zaOffset_SG for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 265;

	INSERT INTO md_Column
	SET columnId = 468, tableId = 8, name = "zRaOffset_SG_Sigma",
		description = "Uncertainty of zRaOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 266;

	INSERT INTO md_Column
	SET columnId = 469, tableId = 8, name = "zDeclOffset_SG",
		description = "Center correction of decl_SG for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 267;

	INSERT INTO md_Column
	SET columnId = 470, tableId = 8, name = "zDeclOffset_SG_Sigma",
		description = "Uncertainty of zDeclOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 268;

	INSERT INTO md_Column
	SET columnId = 471, tableId = 8, name = "zRaDeclOffset_SG_Cov",
		description = "Covariance of zRaOffset_SG and gDeclOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 269;

	INSERT INTO md_Column
	SET columnId = 472, tableId = 8, name = "zLnL_PS",
		description = "Log-likelihood of being a Point Source for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 270;

	INSERT INTO md_Column
	SET columnId = 473, tableId = 8, name = "zLnL_SG",
		description = "Log-likelihood of being a Small Galaxy for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 271;

	INSERT INTO md_Column
	SET columnId = 474, tableId = 8, name = "zFlux_PS",
		description = "Flux for Point Source model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 272;

	INSERT INTO md_Column
	SET columnId = 475, tableId = 8, name = "zFlux_PS_Sigma",
		description = "Uncertainty of zFlux_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 273;

	INSERT INTO md_Column
	SET columnId = 476, tableId = 8, name = "zFlux_SG",
		description = "Flux for Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 274;

	INSERT INTO md_Column
	SET columnId = 477, tableId = 8, name = "zFlux_SG_Sigma",
		description = "Uncertainty of zFlux_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 275;

	INSERT INTO md_Column
	SET columnId = 478, tableId = 8, name = "zFlux_CSG",
		description = "Flux for Cannonical Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 276;

	INSERT INTO md_Column
	SET columnId = 479, tableId = 8, name = "zFlux_CSG_Sigma",
		description = "Uncertainty of zFlux_CSG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 277;

	INSERT INTO md_Column
	SET columnId = 480, tableId = 8, name = "zTimescale",
		description = "Characteristic timescale of flux variations for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "day",
		displayOrder = 278;

	INSERT INTO md_Column
	SET columnId = 481, tableId = 8, name = "zEarliestObsTime",
		description = "Time when this object was observed for the first time in g filter.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 279;

	INSERT INTO md_Column
	SET columnId = 482, tableId = 8, name = "zLatestObsTime",
		description = "The latest time when this object was observed in g filter.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 280;

	INSERT INTO md_Column
	SET columnId = 483, tableId = 8, name = "zSersicN_SG",
		description = "Sersic index for Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 281;

	INSERT INTO md_Column
	SET columnId = 484, tableId = 8, name = "zSersicN_SG_Sigma",
		description = "Uncertainty of zSersicN_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 282;

	INSERT INTO md_Column
	SET columnId = 485, tableId = 8, name = "zE1_SG",
		description = "Ellipticity for Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 283;

	INSERT INTO md_Column
	SET columnId = 486, tableId = 8, name = "zE1_SG_Sigma",
		description = "Uncertainty of zE1_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 284;

	INSERT INTO md_Column
	SET columnId = 487, tableId = 8, name = "zE2_SG",
		description = "Ellipticity for Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 285;

	INSERT INTO md_Column
	SET columnId = 488, tableId = 8, name = "zE2_SG_Sigma",
		description = "Uncertainty of zE2_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 286;

	INSERT INTO md_Column
	SET columnId = 489, tableId = 8, name = "zRadius_SG",
		description = "Size of Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 287;

	INSERT INTO md_Column
	SET columnId = 490, tableId = 8, name = "zRadius_SG_Sigma",
		description = "Uncertainty of zRadius_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 288;

	INSERT INTO md_Column
	SET columnId = 491, tableId = 8, name = "zFlux_ra_PS_Cov",
		description = "Covariance of flux and ra for Point Source model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 289;

	INSERT INTO md_Column
	SET columnId = 492, tableId = 8, name = "zFlux_decl_PS_Cov",
		description = "Covariance of flux and decl for Point Source model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 290;

	INSERT INTO md_Column
	SET columnId = 493, tableId = 8, name = "zRa_decl_PS_Cov",
		description = "Covariance of za and decl for Point Source model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 291;

	INSERT INTO md_Column
	SET columnId = 494, tableId = 8, name = "zFlux_ra_SG_Cov",
		description = "Covariance of flux and ra for Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 292;

	INSERT INTO md_Column
	SET columnId = 495, tableId = 8, name = "zFlux_decl_SG_Cov",
		description = "Covariance of flux and decl for Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 293;

	INSERT INTO md_Column
	SET columnId = 496, tableId = 8, name = "zFlux_SersicN_SG_Cov",
		description = "Covariance of flux and SersicN for Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 294;

	INSERT INTO md_Column
	SET columnId = 497, tableId = 8, name = "zFlux_e1_SG_Cov",
		description = "Covariance of flux and e1 for Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 295;

	INSERT INTO md_Column
	SET columnId = 498, tableId = 8, name = "zFlux_e2_SG_Cov",
		description = "Covariance of flux and e2 for Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 296;

	INSERT INTO md_Column
	SET columnId = 499, tableId = 8, name = "zFlux_radius_SG_Cov",
		description = "Covariance of flux and radius for Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 297;

	INSERT INTO md_Column
	SET columnId = 500, tableId = 8, name = "zRa_decl_SG_Cov",
		description = "Covariance of za and decl for Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 298;

	INSERT INTO md_Column
	SET columnId = 501, tableId = 8, name = "zRa_SersicN_SG_Cov",
		description = "Covariance of za and SersicN for Small Galaxy for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 299;

	INSERT INTO md_Column
	SET columnId = 502, tableId = 8, name = "zRa_e1_SG_Cov",
		description = "Covariance of za and e1 for Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 300;

	INSERT INTO md_Column
	SET columnId = 503, tableId = 8, name = "zRa_e2_SG_Cov",
		description = "Covariance of za and e2 for Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 301;

	INSERT INTO md_Column
	SET columnId = 504, tableId = 8, name = "zRa_radius_SG_Cov",
		description = "Covariance of za and radius for small galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 302;

	INSERT INTO md_Column
	SET columnId = 505, tableId = 8, name = "zDecl_SersicN_SG_Cov",
		description = "Covariance of decl and SersicN for Small Galaxy for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 303;

	INSERT INTO md_Column
	SET columnId = 506, tableId = 8, name = "zDecl_e1_SG_Cov",
		description = "Covariance of decl and e1 for Small Galaxy for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 304;

	INSERT INTO md_Column
	SET columnId = 507, tableId = 8, name = "zDecl_e2_SG_Cov",
		description = "Covariance of decl and e2 for Small Galaxy for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 305;

	INSERT INTO md_Column
	SET columnId = 508, tableId = 8, name = "zDecl_radius_SG_Cov",
		description = "Covariance of decl and radius for Small Galaxy for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 306;

	INSERT INTO md_Column
	SET columnId = 509, tableId = 8, name = "zSersicN_e1_SG_Cov",
		description = "Covariance of SersicN and e1 for Small Galaxy Model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 307;

	INSERT INTO md_Column
	SET columnId = 510, tableId = 8, name = "zSersicN_e2_SG_Cov",
		description = "Covariance of SersicN and e2 for Small Galaxy for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 308;

	INSERT INTO md_Column
	SET columnId = 511, tableId = 8, name = "zSersicN_radius_SG_Cov",
		description = "Covariance of SersicN and radius for Small Galaxy for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 309;

	INSERT INTO md_Column
	SET columnId = 512, tableId = 8, name = "zE1_e2_SG_Cov",
		description = "Covariance of e1 and e2 for Small Galaxy for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 310;

	INSERT INTO md_Column
	SET columnId = 513, tableId = 8, name = "zE1_radius_SG_Cov",
		description = "Covariance of e1 and radius for Small Galaxy for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 311;

	INSERT INTO md_Column
	SET columnId = 514, tableId = 8, name = "zE2_radius_SG_Cov",
		description = "Covariance of e2 and radius for Small Galaxy for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 312;

	INSERT INTO md_Column
	SET columnId = 515, tableId = 8, name = "zFlags",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 313;

	INSERT INTO md_Column
	SET columnId = 516, tableId = 8, name = "yNumObs",
		description = "Number of forced sources associated with this object for y filter.&#xA;",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 314;

	INSERT INTO md_Column
	SET columnId = 517, tableId = 8, name = "yExtendedness",
		description = "Probability that this object is an extended object for y filter. Valid range: 0-1, where 1 indicates an extended object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 315;

	INSERT INTO md_Column
	SET columnId = 518, tableId = 8, name = "yVarProb",
		description = "Probability that this object is variable for y filter. Valid range: 0-1, where 1 indicates a variable object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 316;

	INSERT INTO md_Column
	SET columnId = 519, tableId = 8, name = "yRaOffset_PS",
		description = "Center correction of ya_PS for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 317;

	INSERT INTO md_Column
	SET columnId = 520, tableId = 8, name = "yRaOffset_PS_Sigma",
		description = "Uncertainty of yRaOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 318;

	INSERT INTO md_Column
	SET columnId = 521, tableId = 8, name = "yDeclOffset_PS",
		description = "Center correction of decl_PS for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 319;

	INSERT INTO md_Column
	SET columnId = 522, tableId = 8, name = "yDeclOffset_PS_Sigma",
		description = "Uncertainty of yDeclOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 320;

	INSERT INTO md_Column
	SET columnId = 523, tableId = 8, name = "yRaDeclOffset_PS_Cov",
		description = "Covariance of yRaOffset_PS and gDeclOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 321;

	INSERT INTO md_Column
	SET columnId = 524, tableId = 8, name = "yRaOffset_SG",
		description = "Center correction of yaOffset_SG for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 322;

	INSERT INTO md_Column
	SET columnId = 525, tableId = 8, name = "yRaOffset_SG_Sigma",
		description = "Uncertainty of yRaOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 323;

	INSERT INTO md_Column
	SET columnId = 526, tableId = 8, name = "yDeclOffset_SG",
		description = "Center correction of decl_SG for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 324;

	INSERT INTO md_Column
	SET columnId = 527, tableId = 8, name = "yDeclOffset_SG_Sigma",
		description = "Uncertainty of yDeclOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 325;

	INSERT INTO md_Column
	SET columnId = 528, tableId = 8, name = "yRaDeclOffset_SG_Cov",
		description = "Covariance of yRaOffset_SG and gDeclOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 326;

	INSERT INTO md_Column
	SET columnId = 529, tableId = 8, name = "yLnL_PS",
		description = "Log-likelihood of being a Point Source for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 327;

	INSERT INTO md_Column
	SET columnId = 530, tableId = 8, name = "yLnL_SG",
		description = "Log-likelihood of being a Small Galaxy for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 328;

	INSERT INTO md_Column
	SET columnId = 531, tableId = 8, name = "yFlux_PS",
		description = "Flux for Point Source model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 329;

	INSERT INTO md_Column
	SET columnId = 532, tableId = 8, name = "yFlux_PS_Sigma",
		description = "Uncertainty of yFlux_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 330;

	INSERT INTO md_Column
	SET columnId = 533, tableId = 8, name = "yFlux_SG",
		description = "Flux for Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 331;

	INSERT INTO md_Column
	SET columnId = 534, tableId = 8, name = "yFlux_SG_Sigma",
		description = "Uncertainty of yFlux_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 332;

	INSERT INTO md_Column
	SET columnId = 535, tableId = 8, name = "yFlux_CSG",
		description = "Flux for Cannonical Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 333;

	INSERT INTO md_Column
	SET columnId = 536, tableId = 8, name = "yFlux_CSG_Sigma",
		description = "Uncertainty of yFlux_CSG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 334;

	INSERT INTO md_Column
	SET columnId = 537, tableId = 8, name = "yTimescale",
		description = "Characteristic timescale of flux variations for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "day",
		displayOrder = 335;

	INSERT INTO md_Column
	SET columnId = 538, tableId = 8, name = "yEarliestObsTime",
		description = "Time when this object was observed for the first time in g filter.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 336;

	INSERT INTO md_Column
	SET columnId = 539, tableId = 8, name = "yLatestObsTime",
		description = "The latest time when this object was observed in g filter.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 337;

	INSERT INTO md_Column
	SET columnId = 540, tableId = 8, name = "ySersicN_SG",
		description = "Sersic index for Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 338;

	INSERT INTO md_Column
	SET columnId = 541, tableId = 8, name = "ySersicN_SG_Sigma",
		description = "Uncertainty of ySersicN_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 339;

	INSERT INTO md_Column
	SET columnId = 542, tableId = 8, name = "yE1_SG",
		description = "Ellipticity for Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 340;

	INSERT INTO md_Column
	SET columnId = 543, tableId = 8, name = "yE1_SG_Sigma",
		description = "Uncertainty of yE1_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 341;

	INSERT INTO md_Column
	SET columnId = 544, tableId = 8, name = "yE2_SG",
		description = "Ellipticity for Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 342;

	INSERT INTO md_Column
	SET columnId = 545, tableId = 8, name = "yE2_SG_Sigma",
		description = "Uncertainty of yE2_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 343;

	INSERT INTO md_Column
	SET columnId = 546, tableId = 8, name = "yRadius_SG",
		description = "Size of Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 344;

	INSERT INTO md_Column
	SET columnId = 547, tableId = 8, name = "yRadius_SG_Sigma",
		description = "Uncertainty of yRadius_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 345;

	INSERT INTO md_Column
	SET columnId = 548, tableId = 8, name = "yFlux_ra_PS_Cov",
		description = "Covariance of flux and ra for Point Source model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 346;

	INSERT INTO md_Column
	SET columnId = 549, tableId = 8, name = "yFlux_decl_PS_Cov",
		description = "Covariance of flux and decl for Point Source model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 347;

	INSERT INTO md_Column
	SET columnId = 550, tableId = 8, name = "yRa_decl_PS_Cov",
		description = "Covariance of ya and decl for Point Source model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 348;

	INSERT INTO md_Column
	SET columnId = 551, tableId = 8, name = "yFlux_ra_SG_Cov",
		description = "Covariance of flux and ra for Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 349;

	INSERT INTO md_Column
	SET columnId = 552, tableId = 8, name = "yFlux_decl_SG_Cov",
		description = "Covariance of flux and decl for Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 350;

	INSERT INTO md_Column
	SET columnId = 553, tableId = 8, name = "yFlux_SersicN_SG_Cov",
		description = "Covariance of flux and SersicN for Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 351;

	INSERT INTO md_Column
	SET columnId = 554, tableId = 8, name = "yFlux_e1_SG_Cov",
		description = "Covariance of flux and e1 for Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 352;

	INSERT INTO md_Column
	SET columnId = 555, tableId = 8, name = "yFlux_e2_SG_Cov",
		description = "Covariance of flux and e2 for Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 353;

	INSERT INTO md_Column
	SET columnId = 556, tableId = 8, name = "yFlux_radius_SG_Cov",
		description = "Covariance of flux and radius for Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 354;

	INSERT INTO md_Column
	SET columnId = 557, tableId = 8, name = "yRa_decl_SG_Cov",
		description = "Covariance of ya and decl for Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 355;

	INSERT INTO md_Column
	SET columnId = 558, tableId = 8, name = "yRa_SersicN_SG_Cov",
		description = "Covariance of ya and SersicN for Small Galaxy for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 356;

	INSERT INTO md_Column
	SET columnId = 559, tableId = 8, name = "yRa_e1_SG_Cov",
		description = "Covariance of ya and e1 for Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 357;

	INSERT INTO md_Column
	SET columnId = 560, tableId = 8, name = "yRa_e2_SG_Cov",
		description = "Covariance of ya and e2 for Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 358;

	INSERT INTO md_Column
	SET columnId = 561, tableId = 8, name = "yRa_radius_SG_Cov",
		description = "Covariance of ya and radius for small galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 359;

	INSERT INTO md_Column
	SET columnId = 562, tableId = 8, name = "yDecl_SersicN_SG_Cov",
		description = "Covariance of decl and SersicN for Small Galaxy for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 360;

	INSERT INTO md_Column
	SET columnId = 563, tableId = 8, name = "yDecl_e1_SG_Cov",
		description = "Covariance of decl and e1 for Small Galaxy for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 361;

	INSERT INTO md_Column
	SET columnId = 564, tableId = 8, name = "yDecl_e2_SG_Cov",
		description = "Covariance of decl and e2 for Small Galaxy for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 362;

	INSERT INTO md_Column
	SET columnId = 565, tableId = 8, name = "yDecl_radius_SG_Cov",
		description = "Covariance of decl and radius for Small Galaxy for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 363;

	INSERT INTO md_Column
	SET columnId = 566, tableId = 8, name = "ySersicN_e1_SG_Cov",
		description = "Covariance of SersicN and e1 for Small Galaxy Model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 364;

	INSERT INTO md_Column
	SET columnId = 567, tableId = 8, name = "ySersicN_e2_SG_Cov",
		description = "Covariance of SersicN and e2 for Small Galaxy for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 365;

	INSERT INTO md_Column
	SET columnId = 568, tableId = 8, name = "ySersicN_radius_SG_Cov",
		description = "Covariance of SersicN and radius for Small Galaxy for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 366;

	INSERT INTO md_Column
	SET columnId = 569, tableId = 8, name = "yE1_e2_SG_Cov",
		description = "Covariance of e1 and e2 for Small Galaxy for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 367;

	INSERT INTO md_Column
	SET columnId = 570, tableId = 8, name = "yE1_radius_SG_Cov",
		description = "Covariance of e1 and radius for Small Galaxy for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 368;

	INSERT INTO md_Column
	SET columnId = 571, tableId = 8, name = "yE2_radius_SG_Cov",
		description = "Covariance of e2 and radius for Small Galaxy for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 369;

	INSERT INTO md_Column
	SET columnId = 572, tableId = 8, name = "yFlags",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 370;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 9, name = "ObjectType",
	description = "Table to store description of object types. It includes all object types: static, variables, Solar System objects, etc.";

	INSERT INTO md_Column
	SET columnId = 573, tableId = 9, name = "typeId",
		description = "Unique id.",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 574, tableId = 9, name = "description",
		type = "VARCHAR(255)",
		notNull = 0,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 10, name = "Raw_Amp_Exposure";

	INSERT INTO md_Column
	SET columnId = 575, tableId = 10, name = "rawAmpExposureId",
		description = "Primary key (unique identifier).&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 576, tableId = 10, name = "rawCcdExposureId",
		description = "Pointer to the Raw_Ccd_Exposure containing this rawAmpExposure.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 577, tableId = 10, name = "rawFpaExposureId",
		description = "Pointer to the Raw_Fpa_Exposure containing this rawAmpExposure.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 578, tableId = 10, name = "ampId",
		description = "Amplifier id.&#xA;",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 579, tableId = 10, name = "radecSys",
		description = "Coordinate system type. (Allowed systems: FK5, ICRS)",
		type = "VARCHAR(20)",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 580, tableId = 10, name = "url",
		description = "Logical URL to the actual raw image.",
		type = "VARCHAR(255)",
		notNull = 1,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 581, tableId = 10, name = "ctype1",
		description = "Coordinate projection type, axis 1.",
		type = "VARCHAR(20)",
		notNull = 1,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 582, tableId = 10, name = "ctype2",
		description = "Coordinate projection type, axis 2.",
		type = "VARCHAR(20)",
		notNull = 1,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 583, tableId = 10, name = "crpix1",
		description = "Coordinate reference pixel, axis 1.",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 584, tableId = 10, name = "crpix2",
		description = "Coordinate reference pixel, axis 2.",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 585, tableId = 10, name = "crval1",
		description = "Coordinate value 1 @reference pixel.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 586, tableId = 10, name = "crval2",
		description = "Coordinate value 2 @reference pixel.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 587, tableId = 10, name = "cd11",
		description = "First derivative of coordinate 1 w.r.t. axis 1.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 588, tableId = 10, name = "cd21",
		description = "First derivative of coordinate 2 w.r.t. axis 1.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 589, tableId = 10, name = "cd12",
		description = "First derivative of coordinate 1 w.r.t. axis 2.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 590, tableId = 10, name = "cd22",
		description = "First derivative of coordinate 2 w.r.t. axis 2.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 591, tableId = 10, name = "taiObs",
		description = "TAI-OBS = UTC + offset, offset = 32 s from  1/1/1999 to 1/1/2006",
		type = "TIMESTAMP",
		notNull = 1,
		defaultValue = "0",
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 592, tableId = 10, name = "darkTime",
		description = "Total elapsed time from exposure start to end of read.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 593, tableId = 10, name = "zd",
		description = "Zenith distance at observation mid-point.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 19;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 11, name = "Raw_Ccd_Exposure";

	INSERT INTO md_Column
	SET columnId = 594, tableId = 11, name = "rawCcdExposureId",
		description = "Primary key (unique identifier).&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 595, tableId = 11, name = "rawFpaExposureId",
		description = "pointer to Raw_Fpa_Exposure&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 12, name = "Raw_Fpa_Exposure";

	INSERT INTO md_Column
	SET columnId = 596, tableId = 12, name = "rawFpaExposureId",
		description = "Primary key (unique identifier).&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 597, tableId = 12, name = "ra",
		description = "Right Ascension of aperture center.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 598, tableId = 12, name = "decl",
		description = "Declination of aperture center.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 599, tableId = 12, name = "filterId",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 600, tableId = 12, name = "equinox",
		description = "Equinox of World Coordinate System.",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 601, tableId = 12, name = "dateObs",
		description = "Date/Time of observation start (UTC).",
		type = "TIMESTAMP",
		notNull = 1,
		defaultValue = "0",
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 602, tableId = 12, name = "mjdObs",
		description = "MJD of observation start.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 603, tableId = 12, name = "expTime",
		description = "Duration of exposure.",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 604, tableId = 12, name = "airmass",
		description = "Airmass value for the Amp reference pixel (preferably center, but not guaranteed). Range: [-99.999, 99.999] is enough to accomodate ZD in [0, 89.433].",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 9;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 13, name = "Science_Amp_Exposure";

	INSERT INTO md_Column
	SET columnId = 605, tableId = 13, name = "scienceAmpExposureId",
		description = "Primary key (unique identifier).&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 606, tableId = 13, name = "scienceCcdExposureId",
		description = "Pointer to Science_Ccd_Exposure containing this science amp exposure.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 607, tableId = 13, name = "scienceFpaExposureId",
		description = "Pointer to Science_Fpa_Exposure containing this science amp exposure.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 608, tableId = 13, name = "rawAmpExposureId",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 609, tableId = 13, name = "ampId",
		description = "Pointer to the amplifier corresponding to this amp exposure.",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 610, tableId = 13, name = "filterId",
		description = "Pointer to filter.",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 611, tableId = 13, name = "equinox",
		description = "Equinox of World Coordinate System.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 612, tableId = 13, name = "url",
		description = "Logical URL to the actual calibrated image.",
		type = "VARCHAR(255)",
		notNull = 0,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 613, tableId = 13, name = "ctype1",
		description = "Coordinate projection type, axis 1.",
		type = "VARCHAR(20)",
		notNull = 0,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 614, tableId = 13, name = "ctype2",
		description = "Coordinate projection type, axis 2.",
		type = "VARCHAR(20)",
		notNull = 0,
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 615, tableId = 13, name = "crpix1",
		description = "Coordinate reference pixel, axis 1.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 616, tableId = 13, name = "crpix2",
		description = "Coordinate reference pixel, axis 2.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 617, tableId = 13, name = "crval1",
		description = "Coordinate value 1 @reference pixel.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 618, tableId = 13, name = "crval2",
		description = "Coordinate value 2 @reference pixel.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 619, tableId = 13, name = "cd1_1",
		description = "First derivative of coordinate 1 w.r.t. axis 1.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 620, tableId = 13, name = "cd2_1",
		description = "First derivative of coordinate 2 w.r.t. axis 1.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 621, tableId = 13, name = "cd1_2",
		description = "First derivative of coordinate 1 w.r.t. axis 2.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 622, tableId = 13, name = "cd2_2",
		description = "First derivative of coordinate 2 w.r.t. axis 2.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 623, tableId = 13, name = "dateObs",
		description = "Date/Time of observation start (UTC).",
		type = "TIMESTAMP",
		notNull = 0,
		defaultValue = "0",
		displayOrder = 19;

	INSERT INTO md_Column
	SET columnId = 624, tableId = 13, name = "expTime",
		description = "Duration of exposure.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 20;

	INSERT INTO md_Column
	SET columnId = 625, tableId = 13, name = "ccdSize",
		description = "Size of the entire detector.",
		type = "VARCHAR(50)",
		notNull = 0,
		displayOrder = 21;

	INSERT INTO md_Column
	SET columnId = 626, tableId = 13, name = "photoFlam",
		description = "Inverse sensitivity.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 22;

	INSERT INTO md_Column
	SET columnId = 627, tableId = 13, name = "photoZP",
		description = "System photometric zero-point.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 23;

	INSERT INTO md_Column
	SET columnId = 628, tableId = 13, name = "nCombine",
		description = "Number of images co-added to create a deeper image",
		type = "INTEGER",
		notNull = 0,
		defaultValue = "1",
		displayOrder = 24;

	INSERT INTO md_Column
	SET columnId = 629, tableId = 13, name = "taiMjd",
		description = "Date of the start of the exposure",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 25;

	INSERT INTO md_Column
	SET columnId = 630, tableId = 13, name = "binX",
		description = "Binning of the ccd in x.",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 26;

	INSERT INTO md_Column
	SET columnId = 631, tableId = 13, name = "binY",
		description = "Binning of the ccd in y.",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 27;

	INSERT INTO md_Column
	SET columnId = 632, tableId = 13, name = "readNoise",
		description = "Read noise of the ccd.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 28;

	INSERT INTO md_Column
	SET columnId = 633, tableId = 13, name = "saturationLimit",
		description = "Saturation limit for the ccd (average of the amplifiers).&#xA;",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 29;

	INSERT INTO md_Column
	SET columnId = 634, tableId = 13, name = "dataSection",
		description = "Data section for the ccd in the form of [####:####,####:####]",
		type = "VARCHAR(24)",
		notNull = 0,
		displayOrder = 30;

	INSERT INTO md_Column
	SET columnId = 635, tableId = 13, name = "gain",
		description = "Gain of the ccd.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 31;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 14, name = "Science_Ccd_Exposure";

	INSERT INTO md_Column
	SET columnId = 636, tableId = 14, name = "scienceCcdExposureId",
		description = "Primary key (unique identifier).&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 637, tableId = 14, name = "scienceFpaExposureId",
		description = "Pointer to the corresponding entry in the ScienceFpaExposure table.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 638, tableId = 14, name = "rawCcdExposureId",
		description = "Pointer to the corresponding entry in the Raw_Ccd_Exposure table.&#xA;",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 3;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 15, name = "Science_Fpa_Exposure";

	INSERT INTO md_Column
	SET columnId = 639, tableId = 15, name = "scienceFpaExposureId",
		description = "Primary key (unique identifier).&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 16, name = "Source",
	engine = "MyISAM",
	description = "Table to store high signal-to-noise &quot;sources&quot;. A source is a measurement of  Object's properties from a single image that contains its footprint on the sky.";

	INSERT INTO md_Column
	SET columnId = 640, tableId = 16, name = "sourceId",
		description = "Unique id.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 641, tableId = 16, name = "ccdExposureId",
		description = "Pointer to the CcdExpsoure where this source was measured. Note that we are allowing a source to belong to multiple AmpExposures, but it may not span multiple CcdExposures.&#xA;",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 642, tableId = 16, name = "filterId",
		description = "Pointer to an entry in Filter table: filter used to take Exposure where this Source was measured.&#xA;",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 643, tableId = 16, name = "objectId",
		description = "Pointer to Object table. Might be NULL (each Source will point to either MovingObject or Object)",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 644, tableId = 16, name = "movingObjectId",
		description = "Pointer to MovingObject table. Might be NULL (each Source will point to either MovingObject or Object)",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 645, tableId = 16, name = "ra",
		description = "RA-coordinate of the center of the source.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 646, tableId = 16, name = "raSigma",
		description = "Uncertainty of ra.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 647, tableId = 16, name = "decl",
		description = "Decl-coordinate of the center of the source.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 648, tableId = 16, name = "declSigma",
		description = "Uncertainty of decl.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 649, tableId = 16, name = "xAstrom",
		description = "x position computed by a centroiding algorithm for the purposes of astrometry using Dave Monet's algorithm.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 650, tableId = 16, name = "xAstromSigma",
		description = "Uncertainty of xAstrom.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 651, tableId = 16, name = "yAstrom",
		description = "y position computed by a centroiding algorithm for the purposes of astrometry using Dave Monet's algorithm.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 652, tableId = 16, name = "yAstromSigma",
		description = "Uncertainty of yAstrom.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 653, tableId = 16, name = "xyAstromCov",
		description = "Covariance between the xAstrom and the yAstrom.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 654, tableId = 16, name = "xOther",
		description = "x position computed by a centroiding algorithm for the purposes of astrometry using &quot;other&quot; centroiding algorithm.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 655, tableId = 16, name = "xOtherSigma",
		description = "Uncertainty of xOther.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 656, tableId = 16, name = "yOther",
		description = "y position computed by a centroiding algorithm for the purposes of astrometry using &quot;other&quot; centroiding algorithm.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 657, tableId = 16, name = "yOtherSigma",
		description = "Uncertainty of yOther.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 658, tableId = 16, name = "xyOtherCov",
		description = "Covariance between the xOther and yOther.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 19;

	INSERT INTO md_Column
	SET columnId = 659, tableId = 16, name = "astromRefrRa",
		description = "Astrometric refraction in ra.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "degree",
		displayOrder = 20;

	INSERT INTO md_Column
	SET columnId = 660, tableId = 16, name = "astromRefrRaSigma",
		description = "Uncertainty of astromRefrRa.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "degree",
		displayOrder = 21;

	INSERT INTO md_Column
	SET columnId = 661, tableId = 16, name = "astromRefrDecl",
		description = "Astrometric refraction in decl.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "degree",
		displayOrder = 22;

	INSERT INTO md_Column
	SET columnId = 662, tableId = 16, name = "astromRefrDeclSigma",
		description = "Uncertainty of astromRefrDecl.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "degree",
		displayOrder = 23;

	INSERT INTO md_Column
	SET columnId = 663, tableId = 16, name = "sky",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 24;

	INSERT INTO md_Column
	SET columnId = 664, tableId = 16, name = "skySigma",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 25;

	INSERT INTO md_Column
	SET columnId = 665, tableId = 16, name = "psfLnL",
		description = "ln(likelihood) of being a PSF.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 26;

	INSERT INTO md_Column
	SET columnId = 666, tableId = 16, name = "lnL_SG",
		description = "Log-likelihood of being a Small Galaxy.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 27;

	INSERT INTO md_Column
	SET columnId = 667, tableId = 16, name = "psfFlux",
		description = "Calibrated PSF flux of the object.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 28;

	INSERT INTO md_Column
	SET columnId = 668, tableId = 16, name = "psfFluxSigma",
		description = "Uncertainty of psfFlux.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 29;

	INSERT INTO md_Column
	SET columnId = 669, tableId = 16, name = "apFlux",
		description = "Calibrated aperture flux.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 30;

	INSERT INTO md_Column
	SET columnId = 670, tableId = 16, name = "apFluxSigma",
		description = "Uncertainty of apFlux.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 31;

	INSERT INTO md_Column
	SET columnId = 671, tableId = 16, name = "modelFlux",
		description = "Calibrated adaptive 2D gauss model flux.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 32;

	INSERT INTO md_Column
	SET columnId = 672, tableId = 16, name = "modelFluxSigma",
		description = "Uncertainly of modelFlux.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 33;

	INSERT INTO md_Column
	SET columnId = 673, tableId = 16, name = "flux_SG",
		description = "Flux for Small Galaxy model.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 34;

	INSERT INTO md_Column
	SET columnId = 674, tableId = 16, name = "flux_SG_Sigma",
		description = "Uncertainty of flux_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 35;

	INSERT INTO md_Column
	SET columnId = 675, tableId = 16, name = "galExtinction",
		description = "Galaxy extinction.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 36;

	INSERT INTO md_Column
	SET columnId = 676, tableId = 16, name = "sersicN_SG",
		description = "Sersic index for Small Galaxy model.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 37;

	INSERT INTO md_Column
	SET columnId = 677, tableId = 16, name = "sersicN_SG_Sigma",
		description = "Uncertainty of sersicN_SG&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 38;

	INSERT INTO md_Column
	SET columnId = 678, tableId = 16, name = "e1_SG",
		description = "Ellipticity for Small Galaxy model.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 39;

	INSERT INTO md_Column
	SET columnId = 679, tableId = 16, name = "e1_SG_Sigma",
		description = "Uncertainty of e1_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 40;

	INSERT INTO md_Column
	SET columnId = 680, tableId = 16, name = "e2_SG",
		description = "Ellipticity for Small Galaxy model.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 41;

	INSERT INTO md_Column
	SET columnId = 681, tableId = 16, name = "e2_SG_Sigma",
		description = "Uncertainty of e2_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 42;

	INSERT INTO md_Column
	SET columnId = 682, tableId = 16, name = "radius_SG",
		description = "Size of Small Galaxy model.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 43;

	INSERT INTO md_Column
	SET columnId = 683, tableId = 16, name = "radius_SG_Sigma",
		description = "Uncertainty of radius_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 44;

	INSERT INTO md_Column
	SET columnId = 684, tableId = 16, name = "momentIx",
		description = "Adaptive first moment. The moments are primarily for the moving objects, but should carry some information about defects, cosmics, etc. too.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 45;

	INSERT INTO md_Column
	SET columnId = 685, tableId = 16, name = "momentIxSigma",
		description = "Uncertainty of momentIx.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 46;

	INSERT INTO md_Column
	SET columnId = 686, tableId = 16, name = "momentIy",
		description = "Adaptive first moment.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 47;

	INSERT INTO md_Column
	SET columnId = 687, tableId = 16, name = "momentIySigma",
		description = "Uncertainty of momentIy.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 48;

	INSERT INTO md_Column
	SET columnId = 688, tableId = 16, name = "momentIxx",
		description = "Adaptive second moment.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 49;

	INSERT INTO md_Column
	SET columnId = 689, tableId = 16, name = "momentIxxSigma",
		description = "Uncertainty of momentIxx.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 50;

	INSERT INTO md_Column
	SET columnId = 690, tableId = 16, name = "momentIyy",
		description = "Adaptive second moment.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 51;

	INSERT INTO md_Column
	SET columnId = 691, tableId = 16, name = "momentIyySigma",
		description = "Uncertainty of momentIyy.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 52;

	INSERT INTO md_Column
	SET columnId = 692, tableId = 16, name = "momentIxy",
		description = "Adaptive second moment.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 53;

	INSERT INTO md_Column
	SET columnId = 693, tableId = 16, name = "momentIxySigma",
		description = "Uncertainty of momentIxy.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 54;

	INSERT INTO md_Column
	SET columnId = 694, tableId = 16, name = "tiaObs",
		description = "TAI-OBS = UTC + offset, offset = 32 s from  1/1/1999 to 1/1/2006&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 55;

	INSERT INTO md_Column
	SET columnId = 695, tableId = 16, name = "apCorrection",
		description = "Photometric correction: aperture correction.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 56;

	INSERT INTO md_Column
	SET columnId = 696, tableId = 16, name = "grayExtinction",
		description = "Photometric correction: gray extinction.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 57;

	INSERT INTO md_Column
	SET columnId = 697, tableId = 16, name = "nonGrayExtinction",
		description = "Photometric correction: non gray extinction.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 58;

	INSERT INTO md_Column
	SET columnId = 698, tableId = 16, name = "flags",
		description = "Flags.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 59;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 17, name = "Visit",
	description = "Defines a single Visit. 1 row per LSST visit.";

	INSERT INTO md_Column
	SET columnId = 699, tableId = 17, name = "visitId",
		description = "Unique identifier.&#xA;",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 700, tableId = 17, name = "exposureId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 18, name = "_MovingObjectToType",
	description = "Mapping: moving object --&amp;gt; types, with probabilities";

	INSERT INTO md_Column
	SET columnId = 701, tableId = 18, name = "movingObjectId",
		description = "Pointer to entry in MovingObject table",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 702, tableId = 18, name = "typeId",
		description = "Pointer to entry in ObjectType table",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 703, tableId = 18, name = "probability",
		description = "Probability that given MovingObject is of given type. Range: 0-100 (in%)",
		type = "TINYINT",
		notNull = 0,
		defaultValue = "100",
		displayOrder = 3;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 19, name = "_ObjectToType",
	description = "Mapping Object --&amp;gt; types, with probabilities";

	INSERT INTO md_Column
	SET columnId = 704, tableId = 19, name = "objectId",
		description = "Pointer to an entry in Object table",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 705, tableId = 19, name = "typeId",
		description = "Pointer to an entry in ObjectType table",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 706, tableId = 19, name = "probability",
		description = "Probability that given object is of given type. Range 0-100 %",
		type = "TINYINT",
		notNull = 0,
		defaultValue = "100",
		displayOrder = 3;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 20, name = "_Raw_Fpa_ExposureToVisit",
	description = "Mapping table: exposures --&amp;gt; visit";

	INSERT INTO md_Column
	SET columnId = 707, tableId = 20, name = "visitId",
		description = "Pointer to entry in Visit table - visit that given Exposure belongs to.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 708, tableId = 20, name = "exposureId",
		description = "Pointer to entry in Raw_Fpa_Exposure table.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 21, name = "_Science_Fpa_ExposureToTemplateImage",
	description = "Mapping table: exposures used to build given template image";

	INSERT INTO md_Column
	SET columnId = 709, tableId = 21, name = "scienceFpaExposureId",
		description = "Pointer to an entry in Science_Fpa_Exposure table.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 710, tableId = 21, name = "templateImageId",
		description = "Pointer to an entry in TemplateImage table.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 22, name = "_mops_Config",
	description = "Internal table used to ship runtime configuration data to MOPS worker nodes.&#xA;&#xA;This will eventually be replaced by some other mechanism. Note however that this data must be captured by the LSST software provenance tables.";

	INSERT INTO md_Column
	SET columnId = 711, tableId = 22, name = "configId",
		description = "Referring derived object",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 712, tableId = 22, name = "configText",
		description = "Config contents",
		type = "TEXT",
		notNull = 0,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 23, name = "_mops_EonQueue",
	description = "Internal table which maintains a queue of objects to be passed to the MOPS precovery pipeline.&#xA;&#xA;Will eventually be replaced by a different queueing mechanism.";

	INSERT INTO md_Column
	SET columnId = 713, tableId = 23, name = "movingObjectId",
		description = "Referring derived object",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 714, tableId = 23, name = "eventId",
		description = "Referring history event causing insertion",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 715, tableId = 23, name = "insertTime",
		description = "Wall clock time object was queued",
		type = "TIMESTAMP",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 716, tableId = 23, name = "status",
		description = "Processing status N =&amp;gt; new, I =&amp;gt; ID1 done, P =&amp;gt; precov done, X =&amp;gt; finished",
		type = "CHAR(1)",
		notNull = 0,
		defaultValue = "'I'",
		displayOrder = 4;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 24, name = "_mops_MoidQueue",
	description = "Internal table which maintain a queue of objects to be passed to the MOPS precovery pipeline.&#xA;&#xA;Will eventually be replaced by a different queueing mechanism.";

	INSERT INTO md_Column
	SET columnId = 717, tableId = 24, name = "movingObjectId",
		description = "Referring derived object",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 718, tableId = 24, name = "movingObjectVersion",
		description = "version of referring derived object",
		type = "INT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 719, tableId = 24, name = "eventId",
		description = "Referring history event causing insertion",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 720, tableId = 24, name = "insertTime",
		description = "Wall clock time object was queued",
		type = "TIMESTAMP",
		notNull = 1,
		defaultValue = "CURRENT_TIMESTAMP",
		displayOrder = 4;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 25, name = "_tmpl_Id",
	description = "Template table. Schema for lists of ids (e.g. for Objects to delete)";

	INSERT INTO md_Column
	SET columnId = 721, tableId = 25, name = "id",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 26, name = "_tmpl_IdPair",
	description = "Template table. Schema for list of id pairs.";

	INSERT INTO md_Column
	SET columnId = 722, tableId = 26, name = "first",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 723, tableId = 26, name = "second",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 27, name = "_tmpl_MatchPair",
	description = "Template table. Schema for per-visit match result tables.";

	INSERT INTO md_Column
	SET columnId = 724, tableId = 27, name = "first",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 725, tableId = 27, name = "second",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 726, tableId = 27, name = "distance",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 3;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 28, name = "_tmpl_mops_Ephemeris",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 727, tableId = 28, name = "movingObjectId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 728, tableId = 28, name = "movingObjectVersion",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 729, tableId = 28, name = "ra",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 730, tableId = 28, name = "decl",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 731, tableId = 28, name = "mjd",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 732, tableId = 28, name = "smia",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 733, tableId = 28, name = "smaa",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 734, tableId = 28, name = "pa",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 735, tableId = 28, name = "mag",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 9;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 29, name = "_tmpl_mops_Prediction",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 736, tableId = 29, name = "movingObjectId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 737, tableId = 29, name = "movingObjectVersion",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 738, tableId = 29, name = "ra",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 739, tableId = 29, name = "decl",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 740, tableId = 29, name = "mjd",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 741, tableId = 29, name = "smia",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 742, tableId = 29, name = "smaa",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 743, tableId = 29, name = "pa",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 744, tableId = 29, name = "mag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 745, tableId = 29, name = "magErr",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 10;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 30, name = "mops_Event";

	INSERT INTO md_Column
	SET columnId = 746, tableId = 30, name = "eventId",
		description = "Auto-generated internal event ID",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 747, tableId = 30, name = "procHistoryId",
		description = "Pointer to processing history (prv_ProcHistory)",
		type = "INT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 748, tableId = 30, name = "eventType",
		description = "Type of event (A)ttribution/(P)recovery/(D)erivation/(I)dentification/(R)emoval",
		type = "CHAR(1)",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 749, tableId = 30, name = "eventTime",
		description = "Timestamp for event creation",
		type = "TIMESTAMP",
		notNull = 1,
		defaultValue = "CURRENT_TIMESTAMP",
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 750, tableId = 30, name = "movingObjectId",
		description = "Referring derived object ID",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 751, tableId = 30, name = "movingObjectVersion",
		description = "Pointer to resulting orbit",
		type = "INT",
		notNull = 0,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 752, tableId = 30, name = "orbitCode",
		description = "Information about computed orbit",
		type = "CHAR(1)",
		notNull = 0,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 753, tableId = 30, name = "d3",
		description = "Computed 3-parameter D-criterion",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 754, tableId = 30, name = "d4",
		description = "Computed 4-parameter D-criterion",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 755, tableId = 30, name = "ccdExposureId",
		description = "Referring to Science_Ccd_Exposure id generating the event.&#xA;",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 756, tableId = 30, name = "classification",
		description = "MOPS efficiency classification for event",
		type = "CHAR(1)",
		notNull = 0,
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 757, tableId = 30, name = "ssmId",
		description = "Matching SSM ID for clean classifications",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 12;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 31, name = "mops_Event_OrbitDerivation",
	description = "Table for associating tracklets with derivation events. There is a one to many relationship between events and tracklets (there will be multiple rows per event).";

	INSERT INTO md_Column
	SET columnId = 758, tableId = 31, name = "eventId",
		description = "Parent event ID (from mops_History table)",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 759, tableId = 31, name = "trackletId",
		description = "Associated tracklet ID (multiple rows per event)",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 32, name = "mops_Event_OrbitIdentification",
	description = "Table for associating moving objects with identification events (one object per event). The original orbit and tracklets for the child can be obtained from the MOPS_History table by looking up the child object.";

	INSERT INTO md_Column
	SET columnId = 760, tableId = 32, name = "eventId",
		description = "Parent event ID (from mops_History table)",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 761, tableId = 32, name = "childObjectId",
		description = "Matching (child) derived object ID",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 33, name = "mops_Event_TrackletAttribution",
	description = "Table for associating tracklets with attribution events (one tracklet per event).";

	INSERT INTO md_Column
	SET columnId = 762, tableId = 33, name = "eventId",
		description = "Parent event ID (from mops_History table)",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 763, tableId = 33, name = "trackletId",
		description = "Attributed tracklet ID",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 764, tableId = 33, name = "ephemerisDistance",
		description = "Predicted position minus actual, arcsecs",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 765, tableId = 33, name = "ephemerisUncertainty",
		description = "Predicted error ellipse semi-major axis, arcsecs",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 4;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 34, name = "mops_Event_TrackletPrecovery",
	description = "Table for associating tracklets with precovery events (one precovery per event).";

	INSERT INTO md_Column
	SET columnId = 766, tableId = 34, name = "eventId",
		description = "Parent event ID (from mops_History table)",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 767, tableId = 34, name = "trackletId",
		description = "Precovered tracklet ID",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 768, tableId = 34, name = "ephemerisDistance",
		description = "Predicted position minus actual, arcsecs",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 769, tableId = 34, name = "ephemerisUncertainty",
		description = "Predicted error ellipse semi-major axis, arcsecs",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 4;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 35, name = "mops_Event_TrackletRemoval",
	description = "Table for associating tracklets with removal events (one removal per event).";

	INSERT INTO md_Column
	SET columnId = 770, tableId = 35, name = "eventId",
		description = "Parent event ID (from mops_History table)",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 771, tableId = 35, name = "trackletId",
		description = "Removed tracklet ID",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 36, name = "mops_MovingObjectToTracklet",
	description = "Current membership of tracklets and moving objects.";

	INSERT INTO md_Column
	SET columnId = 772, tableId = 36, name = "movingObjectId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 773, tableId = 36, name = "trackletId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 37, name = "mops_SSM",
	description = "Table that contains synthetic solar system model (SSM) objects.";

	INSERT INTO md_Column
	SET columnId = 774, tableId = 37, name = "ssmId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 775, tableId = 37, name = "ssmDescId",
		description = "Pointer to SSM description",
		type = "SMALLINT",
		notNull = 0,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 776, tableId = 37, name = "q",
		description = "semi-major axis, AU",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 777, tableId = 37, name = "e",
		description = "eccentricity e (dimensionless)",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 778, tableId = 37, name = "i",
		description = "inclination, deg",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 779, tableId = 37, name = "node",
		description = "longitude of ascending node, deg",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 780, tableId = 37, name = "argPeri",
		description = "argument of perihelion, deg",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 781, tableId = 37, name = "timePeri",
		description = "time of perihelion, MJD (UTC)",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 782, tableId = 37, name = "epoch",
		description = "epoch of osculating elements, MJD (UTC)",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 783, tableId = 37, name = "h_v",
		description = "Absolute magnitude",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 784, tableId = 37, name = "h_ss",
		description = "??",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 785, tableId = 37, name = "g",
		description = "Slope parameter g, dimensionless",
		type = "DOUBLE",
		notNull = 0,
		unit = "-",
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 786, tableId = 37, name = "albedo",
		description = "Albedo, dimensionless",
		type = "DOUBLE",
		notNull = 0,
		unit = "-",
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 787, tableId = 37, name = "ssmObjectName",
		description = "MOPS synthetic object name",
		type = "VARCHAR(32)",
		notNull = 1,
		displayOrder = 14;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 38, name = "mops_SSMDesc",
	description = "Table containing object name prefixes and descriptions of synthetic solar system object types.";

	INSERT INTO md_Column
	SET columnId = 788, tableId = 38, name = "ssmDescId",
		description = "Auto-generated row ID",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 789, tableId = 38, name = "prefix",
		description = "MOPS prefix code S0/S1/etc.",
		type = "CHAR(4)",
		notNull = 0,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 790, tableId = 38, name = "description",
		description = "Long description",
		type = "VARCHAR(100)",
		notNull = 0,
		displayOrder = 3;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 39, name = "mops_TrackToTracklet";

	INSERT INTO md_Column
	SET columnId = 791, tableId = 39, name = "trackId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 792, tableId = 39, name = "trackletId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 40, name = "mops_Tracklet";

	INSERT INTO md_Column
	SET columnId = 793, tableId = 40, name = "trackletId",
		description = "Auto-generated internal MOPS tracklet ID",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 794, tableId = 40, name = "ccdExposureId",
		description = "Terminating field ID - pointer to Science_Ccd_Exposure&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 795, tableId = 40, name = "procHistoryId",
		description = "Pointer to processing history (prv_ProcHistory)",
		type = "INT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 796, tableId = 40, name = "ssmId",
		description = "Matching SSM ID for clean classifications",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 797, tableId = 40, name = "velRa",
		description = "Average RA velocity deg/day, cos(dec) applied",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree/day",
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 798, tableId = 40, name = "velRaErr",
		description = "Uncertainty in RA velocity",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree/day",
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 799, tableId = 40, name = "velDecl",
		description = "Average Dec velocity, deg/day)",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree/day",
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 800, tableId = 40, name = "velDeclErr",
		description = "Uncertainty in Dec velocity",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree/day",
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 801, tableId = 40, name = "velTot",
		description = "Average total velocity, deg/day",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree/day",
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 802, tableId = 40, name = "accRa",
		description = "Average RA Acceleration, deg/day^2",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree/day^2",
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 803, tableId = 40, name = "accRaErr",
		description = "Uncertainty in RA acceleration",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree/day^2",
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 804, tableId = 40, name = "accDecl",
		description = "Average Dec Acceleration, deg/day^2",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree/day^2",
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 805, tableId = 40, name = "accDeclErr",
		description = "Uncertainty in Dec acceleration",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree/day^2",
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 806, tableId = 40, name = "extEpoch",
		description = "Extrapolated (central) epoch, MJD (UTC)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 807, tableId = 40, name = "extRa",
		description = "Extrapolated (central) RA, deg",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree",
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 808, tableId = 40, name = "extRaErr",
		description = "Uncertainty in extrapolated RA, deg",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree",
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 809, tableId = 40, name = "extDecl",
		description = "Extrapolated (central) Dec, deg",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree",
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 810, tableId = 40, name = "extDeclErr",
		description = "Uncertainty in extrapolated Dec, deg",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree",
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 811, tableId = 40, name = "extMag",
		description = "Extrapolated (central) magnitude",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 19;

	INSERT INTO md_Column
	SET columnId = 812, tableId = 40, name = "extMagErr",
		description = "Uncertainty in extrapolated mag, deg",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 20;

	INSERT INTO md_Column
	SET columnId = 813, tableId = 40, name = "probability",
		description = "Likelihood tracklet is real (unused currently)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 21;

	INSERT INTO md_Column
	SET columnId = 814, tableId = 40, name = "status",
		description = "processing status (unfound 'X', unattributed 'U', attributed 'A')",
		type = "CHAR(1)",
		notNull = 0,
		displayOrder = 22;

	INSERT INTO md_Column
	SET columnId = 815, tableId = 40, name = "classification",
		description = "MOPS efficiency classification",
		type = "CHAR(1)",
		notNull = 0,
		displayOrder = 23;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 41, name = "mops_TrackletToDiaSource",
	description = "Table maintaining many-to-many relationship between tracklets and detections.&#xA;";

	INSERT INTO md_Column
	SET columnId = 816, tableId = 41, name = "trackletId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 817, tableId = 41, name = "diaSourceId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 42, name = "prv_Filter",
	engine = "MyISAM",
	description = "One row per color - the table will have 6 rows";

	INSERT INTO md_Column
	SET columnId = 818, tableId = 42, name = "filterId",
		description = "Unique id.",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 819, tableId = 42, name = "focalPlaneId",
		description = "Pointer to FocalPlane - focal plane this filter belongs to.",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 820, tableId = 42, name = "name",
		description = "String description of the filter,e.g. 'VR SuperMacho c6027'.",
		type = "VARCHAR(80)",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 821, tableId = 42, name = "url",
		description = "URL for filter transmission curve. (Added from archive specs for LSST precursor data).",
		type = "VARCHAR(255)",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 822, tableId = 42, name = "clam",
		description = "Filter centroid wavelength (Angstroms). (Added from archive specs for LSST precursor data).",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 823, tableId = 42, name = "bw",
		description = "Filter effective bandwidth (Angstroms). (Added from archive specs for LSST precursor data).",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 6;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 43, name = "prv_PolicyFile";

	INSERT INTO md_Column
	SET columnId = 824, tableId = 43, name = "policyFileId",
		description = "Identifier for the file containing the Policy.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 825, tableId = 43, name = "pathName",
		description = "Path to the Policy file.",
		type = "VARCHAR(255)",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 826, tableId = 43, name = "hashValue",
		description = "MD5 hash of the Policy file contents for verification and modification detection.",
		type = "CHAR(32)",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 827, tableId = 43, name = "modifiedDate",
		description = "Time of last modification of the Policy file as provided by the filesystem.",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 4;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 44, name = "prv_PolicyKey";

	INSERT INTO md_Column
	SET columnId = 828, tableId = 44, name = "policyKeyId",
		description = "Identifier for a key within a Policy file.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 829, tableId = 44, name = "policyFileId",
		description = "Identifier for the Policy file.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 830, tableId = 44, name = "keyName",
		description = "Name of the key in the Policy file.",
		type = "VARCHAR(255)",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 831, tableId = 44, name = "keyType",
		description = "Type of the key in the Policy file.",
		type = "VARCHAR(16)",
		notNull = 1,
		displayOrder = 4;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 45, name = "prv_Run";

	INSERT INTO md_Column
	SET columnId = 832, tableId = 45, name = "offset",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 833, tableId = 45, name = "runId",
		type = "VARCHAR(255)",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 834, tableId = 45, name = "hostName",
		type = "VARCHAR(64)",
		notNull = 0,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 835, tableId = 45, name = "processId",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 4;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 46, name = "prv_SoftwarePackage";

	INSERT INTO md_Column
	SET columnId = 836, tableId = 46, name = "packageId",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 837, tableId = 46, name = "packageName",
		type = "VARCHAR(64)",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 47, name = "prv_cnf_PolicyKey";

	INSERT INTO md_Column
	SET columnId = 838, tableId = 47, name = "policyKeyId",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 839, tableId = 47, name = "value",
		type = "TEXT",
		notNull = 0,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 840, tableId = 47, name = "validityBegin",
		type = "DATETIME",
		notNull = 0,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 841, tableId = 47, name = "validityEnd",
		type = "DATETIME",
		notNull = 0,
		displayOrder = 4;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 48, name = "prv_cnf_SoftwarePackage";

	INSERT INTO md_Column
	SET columnId = 842, tableId = 48, name = "packageId",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 843, tableId = 48, name = "version",
		type = "VARCHAR(255)",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 844, tableId = 48, name = "directory",
		type = "VARCHAR(255)",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 845, tableId = 48, name = "validityBegin",
		type = "DATETIME",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 846, tableId = 48, name = "validityEnd",
		type = "DATETIME",
		notNull = 0,
		displayOrder = 5;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 49, name = "sdqa_ImageStatus",
	description = "Unique set of status names and their definitions, e.g. &quot;passed&quot;, &quot;failed&quot;, etc. ";

	INSERT INTO md_Column
	SET columnId = 847, tableId = 49, name = "sdqa_imageStatusId",
		description = "Primary key",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 848, tableId = 49, name = "statusName",
		description = "One-word, camel-case, descriptive name of a possible image status (e.g., passedAuto, marginallyPassedManual, etc.)",
		type = "VARCHAR(30)",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 849, tableId = 49, name = "definition",
		description = "Detailed Definition of the image status",
		type = "VARCHAR(255)",
		notNull = 1,
		displayOrder = 3;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 50, name = "sdqa_Metric",
	description = "Unique set of metric names and associated metadata (e.g., &quot;nDeadPix&quot;, &quot;median&quot;, etc.). There will be approximately 30 records total in this table.";

	INSERT INTO md_Column
	SET columnId = 850, tableId = 50, name = "sdqa_metricId",
		description = "Primary key.",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 851, tableId = 50, name = "metricName",
		description = "One-word, camel-case, descriptive name of a possible metric (e.g., mSatPix, median, etc).",
		type = "VARCHAR(30)",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 852, tableId = 50, name = "physicalUnits",
		description = "Physical units of metric.",
		type = "VARCHAR(30)",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 853, tableId = 50, name = "dataType",
		description = "Flag indicating whether data type of the metric value is integer (0) or float (1)",
		type = "CHAR(1)",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 854, tableId = 50, name = "definition",
		type = "VARCHAR(255)",
		notNull = 1,
		displayOrder = 5;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 51, name = "sdqa_Rating_ForScienceAmpExposure",
	description = "Various SDQA ratings for a given amplifier image. There will approximately 30 of these records per image record.";

	INSERT INTO md_Column
	SET columnId = 855, tableId = 51, name = "sdqa_ratingId",
		description = "Primary key. Auto-increment is used, we define a composite unique key, so potential duplicates will be captured.",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 856, tableId = 51, name = "sdqa_metricId",
		description = "Pointer to sdqa_Metric.",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 857, tableId = 51, name = "sdqa_thresholdId",
		description = "Pointer to sdqa_Threshold.",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 858, tableId = 51, name = "ampExposureId",
		description = "Pointer to Science_Amp_Exposure.",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 859, tableId = 51, name = "metricValue",
		description = "Value of this SDQA metric.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 860, tableId = 51, name = "metricSigma",
		description = "Uncertainty of the value of this metric.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 6;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 52, name = "sdqa_Rating_ForScienceCcdExposure",
	description = "Various SDQA ratings for a given ScienceCcdExposure.&#xA;";

	INSERT INTO md_Column
	SET columnId = 861, tableId = 52, name = "sdqa_ratingId",
		description = "Primary key. Auto-increment is used, we define a composite unique key, so potential duplicates will be captured.",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 862, tableId = 52, name = "sdqa_metricId",
		description = "Pointer to sdqa_Metric.",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 863, tableId = 52, name = "sdqa_thresholdId",
		description = "Pointer to sdqa_Threshold.",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 864, tableId = 52, name = "ccdExposureId",
		description = "Pointer to Science_Ccd_Exposure.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 865, tableId = 52, name = "metricValue",
		description = "Value of this SDQA metric.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 866, tableId = 52, name = "metricSigma",
		description = "Uncertainty of the value of this metric.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 6;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 53, name = "sdqa_Rating_ForScienceFpaExposure",
	description = "Various SDQA ratings for a given ScienceFpaExposure.&#xA;";

	INSERT INTO md_Column
	SET columnId = 867, tableId = 53, name = "sdqa_ratingId",
		description = "Primary key. Auto-increment is used, we define a composite unique key, so potential duplicates will be captured.",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 868, tableId = 53, name = "sdqa_metricId",
		description = "Pointer to sdqa_Metric.",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 869, tableId = 53, name = "sdqa_thresholdId",
		description = "Pointer to sdqa_Threshold.",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 870, tableId = 53, name = "exposureId",
		description = "Pointer to Science_FPA_Exposure.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 871, tableId = 53, name = "metricValue",
		description = "Value of this SDQA metric.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 872, tableId = 53, name = "metricSigma",
		description = "Uncertainty of the value of this metric.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 6;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 54, name = "sdqa_Threshold",
	description = "Version-controlled metric thresholds. Total number of these records is approximately equal to 30 x the number of times the thresholds will be changed over the entire period of LSST operations (of ordre of 100), with most of the changes occuring in the first year of operations.";

	INSERT INTO md_Column
	SET columnId = 873, tableId = 54, name = "sdqa_thresholdId",
		description = "Primary key.",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 874, tableId = 54, name = "sdqa_metricId",
		description = "Pointer to sdqa_Metric table.",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 875, tableId = 54, name = "upperThreshold",
		description = "Threshold for which a metric value is tested to be greater than.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 876, tableId = 54, name = "lowerThreshold",
		description = "Threshold for which a metric value is tested to be less than.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 877, tableId = 54, name = "createdDate",
		description = "Database timestamp when the record is inserted.",
		type = "TIMESTAMP",
		notNull = 1,
		defaultValue = "CURRENT_TIMESTAMP",
		displayOrder = 5;

