library stitch.stitcher_test;

import 'package:barback/barback.dart';
import 'package:guinness/guinness.dart';
import 'package:unittest/unittest.dart' hide expect;
import 'package:stitch/src/transformers.dart';

void main() => describe("Stitcher", () {
  Stitcher stitcher;

  describe("isPrimary()", () {
    beforeEach(() => stitcher = new Stitcher.allFormats());

    it("completes with true for .stitch assets", () {
      var asset = new AssetId("my_package", "file.stitch");
      expect(stitcher.isPrimary(asset), completion(isTrue));
    });

    it("completes with true for .stitch.yaml assets", () {
      var asset = new AssetId("my_package", "file.stitch.yaml");
      expect(stitcher.isPrimary(asset), completion(isTrue));
    });

    it("completes with false for .yaml assets", () {
      var asset = new AssetId("my_package", "file.yaml");
      expect(stitcher.isPrimary(asset), completion(isFalse));
    });
  });
});