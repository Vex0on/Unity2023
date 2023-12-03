{
    "header": {
        "pipelineVersion": "2.2",
        "releaseVersion": "2023.2.0",
        "fileVersion": "1.1",
        "template": false,
        "nodesVersions": {
            "CameraInit": "9.0",
            "ImageMatching": "2.0",
            "DepthMap": "4.0",
            "PrepareDenseScene": "3.0",
            "Meshing": "7.0",
            "Texturing": "6.0",
            "FeatureMatching": "2.0",
            "DepthMapFilter": "3.0",
            "MeshFiltering": "3.0",
            "StructureFromMotion": "3.1",
            "FeatureExtraction": "1.2"
        }
    },
    "graph": {
        "Texturing_1": {
            "nodeType": "Texturing",
            "position": [
                2000,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "fb17a57e32b41f52031f85d73d992b617a454a35"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{Meshing_1.output}",
                "imagesFolder": "{DepthMap_1.imagesFolder}",
                "inputMesh": "{MeshFiltering_1.outputMesh}",
                "inputRefMesh": "",
                "textureSide": 8192,
                "downscale": 2,
                "outputMeshFileType": "obj",
                "colorMapping": {
                    "enable": true,
                    "colorMappingFileType": "exr"
                },
                "bumpMapping": {
                    "enable": true,
                    "bumpType": "Normal",
                    "normalFileType": "exr",
                    "heightFileType": "exr"
                },
                "displacementMapping": {
                    "enable": true,
                    "displacementMappingFileType": "exr"
                },
                "unwrapMethod": "Basic",
                "useUDIM": true,
                "fillHoles": false,
                "padding": 5,
                "multiBandDownscale": 4,
                "multiBandNbContrib": {
                    "high": 1,
                    "midHigh": 5,
                    "midLow": 10,
                    "low": 0
                },
                "useScore": true,
                "bestScoreThreshold": 0.1,
                "angleHardThreshold": 90.0,
                "workingColorSpace": "sRGB",
                "outputColorSpace": "AUTO",
                "correctEV": false,
                "forceVisibleByAllVertices": false,
                "flipNormals": false,
                "visibilityRemappingMethod": "PullPush",
                "subdivisionTargetRatio": 0.8,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/",
                "outputMesh": "{cache}/{nodeType}/{uid0}/texturedMesh.{outputMeshFileTypeValue}",
                "outputMaterial": "{cache}/{nodeType}/{uid0}/texturedMesh.mtl",
                "outputTextures": "{cache}/{nodeType}/{uid0}/texture_*.exr"
            }
        },
        "Meshing_1": {
            "nodeType": "Meshing",
            "position": [
                1600,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "08ff858e00cfc96dfb231f5eb6a3522745bc94c6"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{DepthMapFilter_1.input}",
                "depthMapsFolder": "{DepthMapFilter_1.output}",
                "outputMeshFileType": "obj",
                "useBoundingBox": false,
                "boundingBox": {
                    "bboxTranslation": {
                        "x": 0.0,
                        "y": 0.0,
                        "z": 0.0
                    },
                    "bboxRotation": {
                        "x": 0.0,
                        "y": 0.0,
                        "z": 0.0
                    },
                    "bboxScale": {
                        "x": 1.0,
                        "y": 1.0,
                        "z": 1.0
                    }
                },
                "estimateSpaceFromSfM": true,
                "estimateSpaceMinObservations": 3,
                "estimateSpaceMinObservationAngle": 10.0,
                "maxInputPoints": 50000000,
                "maxPoints": 5000000,
                "maxPointsPerVoxel": 1000000,
                "minStep": 2,
                "partitioning": "singleBlock",
                "repartition": "multiResolution",
                "angleFactor": 15.0,
                "simFactor": 15.0,
                "pixSizeMarginInitCoef": 2.0,
                "pixSizeMarginFinalCoef": 4.0,
                "voteMarginFactor": 4.0,
                "contributeMarginFactor": 2.0,
                "simGaussianSizeInit": 10.0,
                "simGaussianSize": 10.0,
                "minAngleThreshold": 1.0,
                "refineFuse": true,
                "helperPointsGridSize": 10,
                "densify": false,
                "densifyNbFront": 1,
                "densifyNbBack": 1,
                "densifyScale": 20.0,
                "nPixelSizeBehind": 4.0,
                "fullWeight": 1.0,
                "voteFilteringForWeaklySupportedSurfaces": true,
                "addLandmarksToTheDensePointCloud": false,
                "invertTetrahedronBasedOnNeighborsNbIterations": 10,
                "minSolidAngleRatio": 0.2,
                "nbSolidAngleFilteringIterations": 2,
                "colorizeOutput": false,
                "addMaskHelperPoints": false,
                "maskHelperPointsWeight": 1.0,
                "maskBorderSize": 4,
                "maxNbConnectedHelperPoints": 50,
                "saveRawDensePointCloud": false,
                "exportDebugTetrahedralization": false,
                "seed": 0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "outputMesh": "{cache}/{nodeType}/{uid0}/mesh.{outputMeshFileTypeValue}",
                "output": "{cache}/{nodeType}/{uid0}/densePointCloud.abc"
            }
        },
        "DepthMapFilter_1": {
            "nodeType": "DepthMapFilter",
            "position": [
                1400,
                0
            ],
            "parallelization": {
                "blockSize": 10,
                "size": 78,
                "split": 8
            },
            "uids": {
                "0": "5fca6a1ed0cdc835992d9089a4b7903e0fb43afc"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{DepthMap_1.input}",
                "depthMapsFolder": "{DepthMap_1.output}",
                "minViewAngle": 2.0,
                "maxViewAngle": 70.0,
                "nNearestCams": 10,
                "minNumOfConsistentCams": 3,
                "minNumOfConsistentCamsWithLowSimilarity": 4,
                "pixToleranceFactor": 2.0,
                "pixSizeBall": 0,
                "pixSizeBallWithLowSimilarity": 0,
                "computeNormalMaps": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/",
                "depth": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap.exr",
                "sim": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_simMap.exr"
            }
        },
        "ImageMatching_1": {
            "nodeType": "ImageMatching",
            "position": [
                400,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 78,
                "split": 1
            },
            "uids": {
                "0": "19acbed446cfe2796de660bdefbdc807a92d2224"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{FeatureExtraction_1.input}",
                "featuresFolders": [
                    "{FeatureExtraction_1.output}"
                ],
                "method": "SequentialAndVocabularyTree",
                "tree": "${ALICEVISION_VOCTREE}",
                "weights": "",
                "minNbImages": 200,
                "maxDescriptors": 500,
                "nbMatches": 40,
                "nbNeighbors": 5,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/imageMatches.txt"
            }
        },
        "FeatureExtraction_1": {
            "nodeType": "FeatureExtraction",
            "position": [
                200,
                0
            ],
            "parallelization": {
                "blockSize": 40,
                "size": 78,
                "split": 2
            },
            "uids": {
                "0": "8196fa5108333bddfec972b9d06704647e516360"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{CameraInit_1.output}",
                "masksFolder": "",
                "describerTypes": [
                    "dspsift"
                ],
                "describerPreset": "normal",
                "maxNbFeatures": 0,
                "describerQuality": "normal",
                "contrastFiltering": "GridSort",
                "relativePeakThreshold": 0.01,
                "gridFiltering": true,
                "workingColorSpace": "sRGB",
                "forceCpuExtraction": true,
                "maxThreads": 0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/"
            }
        },
        "StructureFromMotion_1": {
            "nodeType": "StructureFromMotion",
            "position": [
                800,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 78,
                "split": 1
            },
            "uids": {
                "0": "28f5a8b9fad92dc80687b9ff554d49a1f366cd8b"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{FeatureMatching_1.input}",
                "featuresFolders": "{FeatureMatching_1.featuresFolders}",
                "matchesFolders": [
                    "{FeatureMatching_1.output}"
                ],
                "describerTypes": "{FeatureMatching_1.describerTypes}",
                "localizerEstimator": "acransac",
                "observationConstraint": "Scale",
                "localizerEstimatorMaxIterations": 4096,
                "localizerEstimatorError": 0.0,
                "lockScenePreviouslyReconstructed": false,
                "useLocalBA": true,
                "localBAGraphDistance": 1,
                "nbFirstUnstableCameras": 30,
                "maxImagesPerGroup": 30,
                "bundleAdjustmentMaxOutliers": 50,
                "maxNumberOfMatches": 0,
                "minNumberOfMatches": 0,
                "minInputTrackLength": 2,
                "minNumberOfObservationsForTriangulation": 2,
                "minAngleForTriangulation": 3.0,
                "minAngleForLandmark": 2.0,
                "maxReprojectionError": 4.0,
                "minAngleInitialPair": 5.0,
                "maxAngleInitialPair": 40.0,
                "useOnlyMatchesFromInputFolder": false,
                "useRigConstraint": true,
                "rigMinNbCamerasForCalibration": 20,
                "lockAllIntrinsics": false,
                "minNbCamerasToRefinePrincipalPoint": 3,
                "filterTrackForks": false,
                "computeStructureColor": true,
                "initialPairA": "",
                "initialPairB": "",
                "interFileExtension": ".abc",
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/sfm.abc",
                "outputViewsAndPoses": "{cache}/{nodeType}/{uid0}/cameras.sfm",
                "extraInfoFolder": "{cache}/{nodeType}/{uid0}/"
            }
        },
        "PrepareDenseScene_1": {
            "nodeType": "PrepareDenseScene",
            "position": [
                1000,
                0
            ],
            "parallelization": {
                "blockSize": 40,
                "size": 78,
                "split": 2
            },
            "uids": {
                "0": "bef344ba475699e5c876e54ebb6fba626233ad91"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{StructureFromMotion_1.output}",
                "imagesFolders": [],
                "masksFolders": [],
                "outputFileType": "exr",
                "saveMetadata": true,
                "saveMatricesTxtFiles": false,
                "evCorrection": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/",
                "undistorted": "{cache}/{nodeType}/{uid0}/<VIEW_ID>.{outputFileTypeValue}"
            }
        },
        "CameraInit_1": {
            "nodeType": "CameraInit",
            "position": [
                0,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 78,
                "split": 1
            },
            "uids": {
                "0": "c56e56e69ef3e4bb0833bdf1b896eeff7dce864f"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "viewpoints": [
                    {
                        "viewId": 13775306,
                        "poseId": 13775306,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031320.png",
                        "intrinsicId": 2827351630,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 42387579,
                        "poseId": 42387579,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031145.png",
                        "intrinsicId": 3679065538,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 43578233,
                        "poseId": 43578233,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031655.png",
                        "intrinsicId": 1593366936,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 88709850,
                        "poseId": 88709850,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031412.png",
                        "intrinsicId": 72918797,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 104414307,
                        "poseId": 104414307,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031439.png",
                        "intrinsicId": 2225025225,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 106404559,
                        "poseId": 106404559,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031422.png",
                        "intrinsicId": 1072724698,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 180648224,
                        "poseId": 180648224,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 032147.png",
                        "intrinsicId": 1695956518,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 197663170,
                        "poseId": 197663170,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031709.png",
                        "intrinsicId": 355641915,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 330057734,
                        "poseId": 330057734,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031724.png",
                        "intrinsicId": 2359121834,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 362261405,
                        "poseId": 362261405,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031619.png",
                        "intrinsicId": 721172348,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 414446015,
                        "poseId": 414446015,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 032109.png",
                        "intrinsicId": 653423955,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 509005405,
                        "poseId": 509005405,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 032246.png",
                        "intrinsicId": 3995162256,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 529795949,
                        "poseId": 529795949,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031917.png",
                        "intrinsicId": 2228301710,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 557882238,
                        "poseId": 557882238,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031756.png",
                        "intrinsicId": 2408606861,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 589453430,
                        "poseId": 589453430,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 032016.png",
                        "intrinsicId": 1860958444,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 594206460,
                        "poseId": 594206460,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031128.png",
                        "intrinsicId": 2585177654,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 603494142,
                        "poseId": 603494142,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031851.png",
                        "intrinsicId": 1783195695,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 609297801,
                        "poseId": 609297801,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031959.png",
                        "intrinsicId": 1949712261,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 628030246,
                        "poseId": 628030246,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031034.png",
                        "intrinsicId": 1292298802,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 652860321,
                        "poseId": 652860321,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 032153.png",
                        "intrinsicId": 3359815385,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 668618367,
                        "poseId": 668618367,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031154.png",
                        "intrinsicId": 1848058479,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 694051637,
                        "poseId": 694051637,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031214.png",
                        "intrinsicId": 2239348515,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 728420584,
                        "poseId": 728420584,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 032053.png",
                        "intrinsicId": 2587650534,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 753972617,
                        "poseId": 753972617,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031018.png",
                        "intrinsicId": 4141240322,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 761864748,
                        "poseId": 761864748,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031929.png",
                        "intrinsicId": 2543892891,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 799842855,
                        "poseId": 799842855,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 030929.png",
                        "intrinsicId": 202474349,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 801870009,
                        "poseId": 801870009,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031748.png",
                        "intrinsicId": 4197380211,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 835215581,
                        "poseId": 835215581,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031345.png",
                        "intrinsicId": 3170607118,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 839928113,
                        "poseId": 839928113,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031809.png",
                        "intrinsicId": 3348185377,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 840419259,
                        "poseId": 840419259,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 032033.png",
                        "intrinsicId": 727029245,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 894453895,
                        "poseId": 894453895,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 030950.png",
                        "intrinsicId": 464155255,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 926093847,
                        "poseId": 926093847,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031702.png",
                        "intrinsicId": 3537184145,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 953393927,
                        "poseId": 953393927,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 032315.png",
                        "intrinsicId": 3853505480,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 977786026,
                        "poseId": 977786026,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031431.png",
                        "intrinsicId": 448649924,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 989023295,
                        "poseId": 989023295,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031054.png",
                        "intrinsicId": 2348187693,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1014259556,
                        "poseId": 1014259556,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 032231.png",
                        "intrinsicId": 3366491242,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1032212614,
                        "poseId": 1032212614,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031608.png",
                        "intrinsicId": 943550282,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1035921878,
                        "poseId": 1035921878,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 032209.png",
                        "intrinsicId": 3314673286,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1040303625,
                        "poseId": 1040303625,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031549.png",
                        "intrinsicId": 20656598,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1118840926,
                        "poseId": 1118840926,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 032006.png",
                        "intrinsicId": 3952193702,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1129020657,
                        "poseId": 1129020657,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031310.png",
                        "intrinsicId": 2407090469,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1147834654,
                        "poseId": 1147834654,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031109.png",
                        "intrinsicId": 3844347314,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1154191717,
                        "poseId": 1154191717,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031043.png",
                        "intrinsicId": 1034150615,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1156357551,
                        "poseId": 1156357551,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031455.png",
                        "intrinsicId": 2473459108,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1199000053,
                        "poseId": 1199000053,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 032118.png",
                        "intrinsicId": 1084622590,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1216450208,
                        "poseId": 1216450208,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031204.png",
                        "intrinsicId": 1648399189,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1268898477,
                        "poseId": 1268898477,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031936.png",
                        "intrinsicId": 1325958160,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1472309984,
                        "poseId": 1472309984,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 032201.png",
                        "intrinsicId": 1850958180,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1478446536,
                        "poseId": 1478446536,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 032308.png",
                        "intrinsicId": 2185997957,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1490020926,
                        "poseId": 1490020926,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 030743.png",
                        "intrinsicId": 3752576270,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1503508254,
                        "poseId": 1503508254,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 032302.png",
                        "intrinsicId": 63966266,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1504141851,
                        "poseId": 1504141851,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 032322.png",
                        "intrinsicId": 196582411,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1507612583,
                        "poseId": 1507612583,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031329.png",
                        "intrinsicId": 3740015334,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1518826944,
                        "poseId": 1518826944,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031943.png",
                        "intrinsicId": 3217741511,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1519128771,
                        "poseId": 1519128771,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031518.png",
                        "intrinsicId": 2868664614,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1523472369,
                        "poseId": 1523472369,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031511.png",
                        "intrinsicId": 378820904,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1540931259,
                        "poseId": 1540931259,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031628.png",
                        "intrinsicId": 403974917,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1563516569,
                        "poseId": 1563516569,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031741.png",
                        "intrinsicId": 492569684,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1631108048,
                        "poseId": 1631108048,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 032141.png",
                        "intrinsicId": 1782610367,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1665910501,
                        "poseId": 1665910501,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031556.png",
                        "intrinsicId": 4142814632,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1680427641,
                        "poseId": 1680427641,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 032102.png",
                        "intrinsicId": 1414362295,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1690715537,
                        "poseId": 1690715537,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031835.png",
                        "intrinsicId": 2476379608,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1691755711,
                        "poseId": 1691755711,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031337.png",
                        "intrinsicId": 2118483445,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1710494939,
                        "poseId": 1710494939,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031716.png",
                        "intrinsicId": 3100841663,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1738013115,
                        "poseId": 1738013115,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 032125.png",
                        "intrinsicId": 3802090332,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1761517431,
                        "poseId": 1761517431,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031844.png",
                        "intrinsicId": 4114691284,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1791862343,
                        "poseId": 1791862343,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031826.png",
                        "intrinsicId": 765553767,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1832772899,
                        "poseId": 1832772899,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031802.png",
                        "intrinsicId": 2954489616,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1870549307,
                        "poseId": 1870549307,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031527.png",
                        "intrinsicId": 3026393876,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1872228648,
                        "poseId": 1872228648,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031404.png",
                        "intrinsicId": 2120958672,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1951362904,
                        "poseId": 1951362904,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 032024.png",
                        "intrinsicId": 3491246247,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1992576741,
                        "poseId": 1992576741,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031923.png",
                        "intrinsicId": 2392692700,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2006802146,
                        "poseId": 2006802146,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 032239.png",
                        "intrinsicId": 1806231387,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2020703904,
                        "poseId": 2020703904,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 032224.png",
                        "intrinsicId": 1839046566,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2055424173,
                        "poseId": 2055424173,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031005.png",
                        "intrinsicId": 1634773642,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2067982987,
                        "poseId": 2067982987,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031119.png",
                        "intrinsicId": 1048854228,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2069797499,
                        "poseId": 2069797499,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031859.png",
                        "intrinsicId": 3184247,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2087334847,
                        "poseId": 2087334847,
                        "path": "C:/Users/Jacek/Downloads/Zrzut ekranu 2023-11-29 031502.png",
                        "intrinsicId": 2552591860,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"inch\", \"XResolution\": \"95.9866\", \"YResolution\": \"95.9866\", \"oiio:ColorSpace\": \"sRGB\"}"
                    }
                ],
                "intrinsics": [
                    {
                        "intrinsicId": 3184247,
                        "initialFocalLength": -1.0,
                        "focalLength": 45.885940669051784,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 304,
                        "height": 321,
                        "sensorWidth": 36.0,
                        "sensorHeight": 34.09345794392523,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 20656598,
                        "initialFocalLength": -1.0,
                        "focalLength": 45.36437781729444,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 296,
                        "height": 309,
                        "sensorWidth": 36.0,
                        "sensorHeight": 34.48543689320388,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 63966266,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 362,
                        "height": 322,
                        "sensorWidth": 36.0,
                        "sensorHeight": 32.02209944751381,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 72918797,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 321,
                        "height": 256,
                        "sensorWidth": 36.0,
                        "sensorHeight": 28.710280373831775,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 196582411,
                        "initialFocalLength": -1.0,
                        "focalLength": 56.981005982235295,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 347,
                        "height": 455,
                        "sensorWidth": 36.0,
                        "sensorHeight": 27.454945054945053,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 202474349,
                        "initialFocalLength": -1.0,
                        "focalLength": 49.998634136697625,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 445,
                        "height": 512,
                        "sensorWidth": 36.0,
                        "sensorHeight": 31.2890625,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 355641915,
                        "initialFocalLength": -1.0,
                        "focalLength": 56.782302987015186,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 300,
                        "height": 392,
                        "sensorWidth": 36.0,
                        "sensorHeight": 27.551020408163264,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 378820904,
                        "initialFocalLength": -1.0,
                        "focalLength": 53.935549297004066,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 311,
                        "height": 386,
                        "sensorWidth": 36.0,
                        "sensorHeight": 29.00518134715026,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 403974917,
                        "initialFocalLength": -1.0,
                        "focalLength": 46.07699027614935,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 315,
                        "height": 334,
                        "sensorWidth": 36.0,
                        "sensorHeight": 33.952095808383234,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 448649924,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 316,
                        "height": 265,
                        "sensorWidth": 36.0,
                        "sensorHeight": 30.18987341772152,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 464155255,
                        "initialFocalLength": -1.0,
                        "focalLength": 44.7253406925928,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 445,
                        "height": 458,
                        "sensorWidth": 36.0,
                        "sensorHeight": 34.97816593886463,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 492569684,
                        "initialFocalLength": -1.0,
                        "focalLength": 58.318065904462344,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 269,
                        "height": 361,
                        "sensorWidth": 36.0,
                        "sensorHeight": 26.825484764542935,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 653423955,
                        "initialFocalLength": -1.0,
                        "focalLength": 56.56625133261977,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 295,
                        "height": 384,
                        "sensorWidth": 36.0,
                        "sensorHeight": 27.65625,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 721172348,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 298,
                        "height": 255,
                        "sensorWidth": 36.0,
                        "sensorHeight": 30.805369127516776,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 727029245,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 283,
                        "height": 265,
                        "sensorWidth": 36.0,
                        "sensorHeight": 33.71024734982332,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 765553767,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 318,
                        "height": 282,
                        "sensorWidth": 36.0,
                        "sensorHeight": 31.924528301886795,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 943550282,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 304,
                        "height": 258,
                        "sensorWidth": 36.0,
                        "sensorHeight": 30.552631578947366,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 1034150615,
                        "initialFocalLength": -1.0,
                        "focalLength": 47.4490838529112,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 370,
                        "height": 404,
                        "sensorWidth": 36.0,
                        "sensorHeight": 32.97029702970297,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 1048854228,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 369,
                        "height": 344,
                        "sensorWidth": 36.0,
                        "sensorHeight": 33.5609756097561,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 1072724698,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271572,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 310,
                        "height": 267,
                        "sensorWidth": 36.0,
                        "sensorHeight": 31.006451612903227,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 1084622590,
                        "initialFocalLength": -1.0,
                        "focalLength": 60.96323456064434,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 278,
                        "height": 390,
                        "sensorWidth": 36.0,
                        "sensorHeight": 25.661538461538463,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 1292298802,
                        "initialFocalLength": -1.0,
                        "focalLength": 44.03525537768525,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 375,
                        "height": 380,
                        "sensorWidth": 36.0,
                        "sensorHeight": 35.526315789473685,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 1325958160,
                        "initialFocalLength": -1.0,
                        "focalLength": 45.78904380715682,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 298,
                        "height": 314,
                        "sensorWidth": 36.0,
                        "sensorHeight": 34.1656050955414,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 1414362295,
                        "initialFocalLength": -1.0,
                        "focalLength": 50.72133225679752,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 317,
                        "height": 370,
                        "sensorWidth": 36.0,
                        "sensorHeight": 30.843243243243244,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 1593366936,
                        "initialFocalLength": -1.0,
                        "focalLength": 46.75628798013715,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 316,
                        "height": 340,
                        "sensorWidth": 36.0,
                        "sensorHeight": 33.45882352941177,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 1634773642,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.553278750793545,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 446,
                        "height": 447,
                        "sensorWidth": 36.0,
                        "sensorHeight": 35.91946308724832,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 1648399189,
                        "initialFocalLength": -1.0,
                        "focalLength": 44.27356161964853,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 372,
                        "height": 379,
                        "sensorWidth": 36.0,
                        "sensorHeight": 35.33509234828496,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 1695956518,
                        "initialFocalLength": -1.0,
                        "focalLength": 56.356797846646934,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 256,
                        "height": 332,
                        "sensorWidth": 36.0,
                        "sensorHeight": 27.759036144578314,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 1782610367,
                        "initialFocalLength": -1.0,
                        "focalLength": 52.67375045177662,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 264,
                        "height": 320,
                        "sensorWidth": 36.0,
                        "sensorHeight": 29.7,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 1783195695,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 305,
                        "height": 270,
                        "sensorWidth": 36.0,
                        "sensorHeight": 31.868852459016395,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 1806231387,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 296,
                        "height": 272,
                        "sensorWidth": 36.0,
                        "sensorHeight": 33.08108108108108,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 1839046566,
                        "initialFocalLength": -1.0,
                        "focalLength": 45.33893070136672,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 300,
                        "height": 313,
                        "sensorWidth": 36.0,
                        "sensorHeight": 34.50479233226837,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 1848058479,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 375,
                        "height": 356,
                        "sensorWidth": 36.0,
                        "sensorHeight": 34.175999999999995,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 1850958180,
                        "initialFocalLength": -1.0,
                        "focalLength": 51.39628075643452,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 301,
                        "height": 356,
                        "sensorWidth": 36.0,
                        "sensorHeight": 30.43820224719101,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 1860958444,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 279,
                        "height": 275,
                        "sensorWidth": 36.0,
                        "sensorHeight": 35.48387096774193,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 1949712261,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 285,
                        "height": 264,
                        "sensorWidth": 36.0,
                        "sensorHeight": 33.34736842105263,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 2118483445,
                        "initialFocalLength": -1.0,
                        "focalLength": 47.815491914962266,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 309,
                        "height": 340,
                        "sensorWidth": 36.0,
                        "sensorHeight": 32.71764705882353,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 2120958672,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.4558441227157,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 312,
                        "height": 294,
                        "sensorWidth": 36.0,
                        "sensorHeight": 33.92307692307692,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 2185997957,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 368,
                        "height": 301,
                        "sensorWidth": 36.0,
                        "sensorHeight": 29.445652173913043,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 2225025225,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 308,
                        "height": 261,
                        "sensorWidth": 36.0,
                        "sensorHeight": 30.506493506493506,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 2228301710,
                        "initialFocalLength": -1.0,
                        "focalLength": 49.753792546297696,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 276,
                        "height": 316,
                        "sensorWidth": 36.0,
                        "sensorHeight": 31.443037974683545,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 2239348515,
                        "initialFocalLength": -1.0,
                        "focalLength": 55.80395283518137,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 366,
                        "height": 470,
                        "sensorWidth": 36.0,
                        "sensorHeight": 28.03404255319149,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 2348187693,
                        "initialFocalLength": -1.0,
                        "focalLength": 55.435563313302204,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 370,
                        "height": 472,
                        "sensorWidth": 36.0,
                        "sensorHeight": 28.220338983050848,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 2359121834,
                        "initialFocalLength": -1.0,
                        "focalLength": 54.50394008611801,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 295,
                        "height": 370,
                        "sensorWidth": 36.0,
                        "sensorHeight": 28.7027027027027,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 2392692700,
                        "initialFocalLength": -1.0,
                        "focalLength": 55.32330356185093,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 249,
                        "height": 317,
                        "sensorWidth": 36.0,
                        "sensorHeight": 28.277602523659304,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 2407090469,
                        "initialFocalLength": -1.0,
                        "focalLength": 63.33312298010933,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 317,
                        "height": 462,
                        "sensorWidth": 36.0,
                        "sensorHeight": 24.701298701298704,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 2408606861,
                        "initialFocalLength": -1.0,
                        "focalLength": 54.660486858189444,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 287,
                        "height": 361,
                        "sensorWidth": 36.0,
                        "sensorHeight": 28.620498614958446,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 2473459108,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.4558441227157,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 312,
                        "height": 288,
                        "sensorWidth": 36.0,
                        "sensorHeight": 33.23076923076923,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 2476379608,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 309,
                        "height": 252,
                        "sensorWidth": 36.0,
                        "sensorHeight": 29.35922330097087,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 2543892891,
                        "initialFocalLength": -1.0,
                        "focalLength": 45.38110303954488,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 316,
                        "height": 330,
                        "sensorWidth": 36.0,
                        "sensorHeight": 34.47272727272727,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 2552591860,
                        "initialFocalLength": -1.0,
                        "focalLength": 48.01514580116457,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 305,
                        "height": 337,
                        "sensorWidth": 36.0,
                        "sensorHeight": 32.58160237388724,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 2585177654,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 369,
                        "height": 288,
                        "sensorWidth": 36.0,
                        "sensorHeight": 28.097560975609756,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 2587650534,
                        "initialFocalLength": -1.0,
                        "focalLength": 47.91285377632758,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 312,
                        "height": 344,
                        "sensorWidth": 36.0,
                        "sensorHeight": 32.651162790697676,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 2827351630,
                        "initialFocalLength": -1.0,
                        "focalLength": 50.19651961369801,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 303,
                        "height": 350,
                        "sensorWidth": 36.0,
                        "sensorHeight": 31.165714285714287,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 2868664614,
                        "initialFocalLength": -1.0,
                        "focalLength": 49.08119611271127,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 309,
                        "height": 349,
                        "sensorWidth": 36.0,
                        "sensorHeight": 31.873925501432666,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 2954489616,
                        "initialFocalLength": -1.0,
                        "focalLength": 46.110702766868755,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 311,
                        "height": 330,
                        "sensorWidth": 36.0,
                        "sensorHeight": 33.92727272727272,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 3026393876,
                        "initialFocalLength": -1.0,
                        "focalLength": 46.65326409161118,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 299,
                        "height": 321,
                        "sensorWidth": 36.0,
                        "sensorHeight": 33.532710280373834,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 3100841663,
                        "initialFocalLength": -1.0,
                        "focalLength": 47.60180804961792,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 283,
                        "height": 310,
                        "sensorWidth": 36.0,
                        "sensorHeight": 32.86451612903226,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 3170607118,
                        "initialFocalLength": -1.0,
                        "focalLength": 44.9781826110911,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 314,
                        "height": 325,
                        "sensorWidth": 36.0,
                        "sensorHeight": 34.78153846153846,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 3217741511,
                        "initialFocalLength": -1.0,
                        "focalLength": 45.31823744226066,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 280,
                        "height": 292,
                        "sensorWidth": 36.0,
                        "sensorHeight": 34.52054794520548,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 3314673286,
                        "initialFocalLength": -1.0,
                        "focalLength": 48.94196397873962,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 301,
                        "height": 339,
                        "sensorWidth": 36.0,
                        "sensorHeight": 31.964601769911503,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 3348185377,
                        "initialFocalLength": -1.0,
                        "focalLength": 45.0334490248605,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 303,
                        "height": 314,
                        "sensorWidth": 36.0,
                        "sensorHeight": 34.738853503184714,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 3359815385,
                        "initialFocalLength": -1.0,
                        "focalLength": 53.75980716212252,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 291,
                        "height": 360,
                        "sensorWidth": 36.0,
                        "sensorHeight": 29.1,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 3366491242,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.4558441227157,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 303,
                        "height": 267,
                        "sensorWidth": 36.0,
                        "sensorHeight": 31.72277227722772,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 3491246247,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271572,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 310,
                        "height": 294,
                        "sensorWidth": 36.0,
                        "sensorHeight": 34.14193548387097,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 3537184145,
                        "initialFocalLength": -1.0,
                        "focalLength": 49.350485439046224,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 317,
                        "height": 360,
                        "sensorWidth": 36.0,
                        "sensorHeight": 31.7,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 3679065538,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 374,
                        "height": 325,
                        "sensorWidth": 36.0,
                        "sensorHeight": 31.28342245989305,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 3740015334,
                        "initialFocalLength": -1.0,
                        "focalLength": 52.08945553782479,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 302,
                        "height": 362,
                        "sensorWidth": 36.0,
                        "sensorHeight": 30.03314917127072,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 3752576270,
                        "initialFocalLength": -1.0,
                        "focalLength": 64.98889692791788,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 446,
                        "height": 667,
                        "sensorWidth": 36.0,
                        "sensorHeight": 24.071964017991007,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 3802090332,
                        "initialFocalLength": -1.0,
                        "focalLength": 44.16590693517838,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 306,
                        "height": 311,
                        "sensorWidth": 36.0,
                        "sensorHeight": 35.42122186495177,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 3844347314,
                        "initialFocalLength": -1.0,
                        "focalLength": 45.8240100149618,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 367,
                        "height": 387,
                        "sensorWidth": 36.0,
                        "sensorHeight": 34.13953488372093,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 3853505480,
                        "initialFocalLength": -1.0,
                        "focalLength": 48.708748357329696,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 364,
                        "height": 408,
                        "sensorWidth": 36.0,
                        "sensorHeight": 32.11764705882353,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 3952193702,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.4558441227157,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 311,
                        "height": 274,
                        "sensorWidth": 36.0,
                        "sensorHeight": 31.717041800643088,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 3995162256,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271572,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 310,
                        "height": 271,
                        "sensorWidth": 36.0,
                        "sensorHeight": 31.470967741935482,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 4114691284,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271572,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 310,
                        "height": 257,
                        "sensorWidth": 36.0,
                        "sensorHeight": 29.845161290322583,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 4141240322,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.4558441227157,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 449,
                        "height": 351,
                        "sensorWidth": 36.0,
                        "sensorHeight": 28.14253897550111,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 4142814632,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 309,
                        "height": 295,
                        "sensorWidth": 36.0,
                        "sensorHeight": 34.368932038834956,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    },
                    {
                        "intrinsicId": 4197380211,
                        "initialFocalLength": -1.0,
                        "focalLength": 49.402433318455756,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 285,
                        "height": 324,
                        "sensorWidth": 36.0,
                        "sensorHeight": 31.666666666666668,
                        "serialNumber": "C:/Users/Jacek/Downloads",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    }
                ],
                "sensorDatabase": "${ALICEVISION_SENSOR_DB}",
                "lensCorrectionProfileInfo": "${ALICEVISION_LENS_PROFILE_INFO}",
                "lensCorrectionProfileSearchIgnoreCameraModel": true,
                "defaultFieldOfView": 45.0,
                "groupCameraFallback": "folder",
                "allowedCameraModels": [
                    "pinhole",
                    "radial1",
                    "radial3",
                    "brown",
                    "fisheye4",
                    "fisheye1",
                    "3deanamorphic4",
                    "3deradial4",
                    "3declassicld"
                ],
                "rawColorInterpretation": "LibRawWhiteBalancing",
                "colorProfileDatabase": "${ALICEVISION_COLOR_PROFILE_DB}",
                "errorOnMissingColorProfile": true,
                "viewIdMethod": "metadata",
                "viewIdRegex": ".*?(\\d+)",
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/cameraInit.sfm"
            }
        },
        "DepthMap_1": {
            "nodeType": "DepthMap",
            "position": [
                1200,
                0
            ],
            "parallelization": {
                "blockSize": 3,
                "size": 78,
                "split": 26
            },
            "uids": {
                "0": "0605930cffcfb0f5542a1da94270bdc547def0d9"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{PrepareDenseScene_1.input}",
                "imagesFolder": "{PrepareDenseScene_1.output}",
                "downscale": 2,
                "minViewAngle": 2.0,
                "maxViewAngle": 70.0,
                "tiling": {
                    "tileBufferWidth": 1024,
                    "tileBufferHeight": 1024,
                    "tilePadding": 64,
                    "autoAdjustSmallImage": true
                },
                "chooseTCamsPerTile": true,
                "maxTCams": 10,
                "sgm": {
                    "sgmScale": 2,
                    "sgmStepXY": 2,
                    "sgmStepZ": -1,
                    "sgmMaxTCamsPerTile": 4,
                    "sgmWSH": 4,
                    "sgmUseSfmSeeds": true,
                    "sgmSeedsRangeInflate": 0.2,
                    "sgmDepthThicknessInflate": 0.0,
                    "sgmMaxSimilarity": 1.0,
                    "sgmGammaC": 5.5,
                    "sgmGammaP": 8.0,
                    "sgmP1": 10.0,
                    "sgmP2Weighting": 100.0,
                    "sgmMaxDepths": 1500,
                    "sgmFilteringAxes": "YX",
                    "sgmDepthListPerTile": true,
                    "sgmUseConsistentScale": false
                },
                "refine": {
                    "refineEnabled": true,
                    "refineScale": 1,
                    "refineStepXY": 1,
                    "refineMaxTCamsPerTile": 4,
                    "refineSubsampling": 10,
                    "refineHalfNbDepths": 15,
                    "refineWSH": 3,
                    "refineSigma": 15.0,
                    "refineGammaC": 15.5,
                    "refineGammaP": 8.0,
                    "refineInterpolateMiddleDepth": false,
                    "refineUseConsistentScale": false
                },
                "colorOptimization": {
                    "colorOptimizationEnabled": true,
                    "colorOptimizationNbIterations": 100
                },
                "customPatchPattern": {
                    "sgmUseCustomPatchPattern": false,
                    "refineUseCustomPatchPattern": false,
                    "customPatchPatternSubparts": [],
                    "customPatchPatternGroupSubpartsPerLevel": false
                },
                "intermediateResults": {
                    "exportIntermediateDepthSimMaps": false,
                    "exportIntermediateNormalMaps": false,
                    "exportIntermediateVolumes": false,
                    "exportIntermediateCrossVolumes": false,
                    "exportIntermediateTopographicCutVolumes": false,
                    "exportIntermediateVolume9pCsv": false,
                    "exportTilePattern": false
                },
                "nbGPUs": 0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/",
                "depth": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap.exr",
                "sim": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_simMap.exr",
                "tilePattern": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_tilePattern.obj",
                "depthSgm": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap_sgm.exr",
                "depthSgmUpscaled": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap_sgmUpscaled.exr",
                "depthRefined": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap_refinedFused.exr"
            }
        },
        "MeshFiltering_1": {
            "nodeType": "MeshFiltering",
            "position": [
                1800,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "68fb93749656ffb0626172bb4614cf81430cd6c5"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "inputMesh": "{Meshing_1.outputMesh}",
                "outputMeshFileType": "obj",
                "keepLargestMeshOnly": false,
                "smoothingSubset": "all",
                "smoothingBoundariesNeighbours": 0,
                "smoothingIterations": 5,
                "smoothingLambda": 1.0,
                "filteringSubset": "all",
                "filteringIterations": 1,
                "filterLargeTrianglesFactor": 60.0,
                "filterTrianglesRatio": 0.0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "outputMesh": "{cache}/{nodeType}/{uid0}/mesh.{outputMeshFileTypeValue}"
            }
        },
        "FeatureMatching_1": {
            "nodeType": "FeatureMatching",
            "position": [
                600,
                0
            ],
            "parallelization": {
                "blockSize": 20,
                "size": 78,
                "split": 4
            },
            "uids": {
                "0": "6d2da7422800f956f07c0065c7713d5c2ce9ffc0"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{ImageMatching_1.input}",
                "featuresFolders": "{ImageMatching_1.featuresFolders}",
                "imagePairsList": "{ImageMatching_1.output}",
                "describerTypes": "{FeatureExtraction_1.describerTypes}",
                "photometricMatchingMethod": "ANN_L2",
                "geometricEstimator": "acransac",
                "geometricFilterType": "fundamental_matrix",
                "distanceRatio": 0.8,
                "maxIteration": 2048,
                "geometricError": 0.0,
                "knownPosesGeometricErrorMax": 5.0,
                "minRequired2DMotion": -1.0,
                "maxMatches": 0,
                "savePutativeMatches": false,
                "crossMatching": false,
                "guidedMatching": false,
                "matchFromKnownCameraPoses": false,
                "exportDebugFiles": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/"
            }
        }
    }
}