//
//  BoardViewController.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 28.11.20..
//

import UIKit

class BoardViewController: BaseViewController {

    // MARK: - Properties
    
    private var customView: BoardView!{
        loadViewIfNeeded()
        return view as? BoardView
    }
    private lazy var numberPickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()
    var viewModel: BoardViewModelProtocol!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customView.setup(target: self,
                         randomSelector: #selector(randomButtonAction),
                         numbersSelector: #selector(numberDoneSelectorAction),
                         inuptView: numberPickerView,
                         delegate: self,
                         dataSource: self)
        getDrawAPI()
    }
}

// MARK: - Actions

extension BoardViewController {
    
    @objc private func randomButtonAction() {
        let randomNumbers = viewModel.selectionNumberArray[randomPick: viewModel.selectedNumber]
        viewModel.selectedNumbers = randomNumbers
        customView.numbersCollectionView.reloadData()
    }
    
    @objc private func numberDoneSelectorAction() {
        self.view.endEditing(true)
        let pickerRow = numberPickerView.selectedRow(inComponent: 0)
        let selectedNumber = viewModel.getNumberFor(row: pickerRow)
        customView.numbersTextField.textField.text = "\(selectedNumber)"
        viewModel.selectedNumber = selectedNumber
    }
}

// MARK: - Web Services

extension BoardViewController {
    
    private func getDrawAPI() {
        showProgressHUD()
        
        viewModel.getDraw {
            DispatchQueue.main.async {
                self.hideProgressHUD()
                if let draw = self.viewModel.drawModel {
                    self.customView.fill(draw)
                }
            }
        }
    }
}

// MARK: - UIPickerViewDataSource, UIPickerViewDelegate

extension BoardViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.getNumbersCount()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(viewModel.getNumberFor(row: row))"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedNumber = viewModel.getNumberFor(row: row)
        customView.numbersTextField.textField.text = "\(selectedNumber)"
        viewModel.selectedNumber = selectedNumber
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension BoardViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case customView.combinationCollectionView:
            return viewModel.getNumbersCount()
        case customView.numbersCollectionView:
            return viewModel.getSelectionNumbersCount()
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case customView.combinationCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CombinationCollectionViewCell.cellID, for: indexPath) as! CombinationCollectionViewCell
            cell.setup(combinations: "\(viewModel.getNumberFor(row: indexPath.row))", odd: viewModel.getOddFor(indexPath: indexPath))
            return cell
        case customView.numbersCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumbersCollectionViewCell.cellID, for: indexPath) as! NumbersCollectionViewCell
            let number = viewModel.getSelectionNumberFor(indexPath: indexPath)
            cell.setup(number, isSelected: viewModel.selectedNumbers.contains(number))
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let number = viewModel.getSelectionNumberFor(indexPath: indexPath)
        
        if viewModel.selectedNumbers.contains(number) {
            guard let index = viewModel.selectedNumbers.firstIndex(of: number) else { return }
            viewModel.selectedNumbers.remove(at: index)
        } else if viewModel.selectedNumber == viewModel.selectedNumbers.count {
            showAlert(message: "Izabrali ste maksimalan broj brojeva.")
        } else {
            viewModel.selectedNumbers.append(number)
        }
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case customView.combinationCollectionView:
            let width = collectionView.frame.width / 7
            let height = collectionView.frame.width / 2
            return CGSize(width: width, height: height)
        case customView.numbersCollectionView:
            let width = collectionView.frame.width / 5
            return CGSize(width: width, height: width)
        default:
            return CGSize(width: 0, height: 0)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}
