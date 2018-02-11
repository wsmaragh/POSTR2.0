//  ProfileView.swift
//  POSTR
//  Created by Winston Maragh on 1/30/18.
//  Copyright © 2018 On-The-Line. All rights reserved.

import UIKit
import Firebase
import Kingfisher
//import SnapKit

class ProfileView: UIView {

	// MARK: - Create elements in View
	lazy var profileContainer: UIView = {
		let pc = UIView()
		return pc
	}()
	lazy var backgroundImageView: UIImageView = {
		let iv = UIImageView()
		iv.image = #imageLiteral(resourceName: "bgPencil")
		return iv
	}()
	lazy var profileImageView: UIImageView = {
		let iv = UIImageView()
		iv.image = #imageLiteral(resourceName: "user2")
		return iv
	}()

	lazy var usernameTF: UITextField = {
		let tf = UITextField()
		tf.placeholder = "Ben Stone"
		tf.textAlignment = .left
		tf.font = UIFont.systemFont(ofSize: 13, weight: .light)
		tf.tag = 0
		tf.backgroundColor = .clear
		return tf
	}()
	lazy var taglineTF: UITextField = {
		let tf = UITextField()
		tf.placeholder = "Good Stuff!! Good Stuff!!!"
		tf.textColor = UIColor.black
		tf.font = UIFont.systemFont(ofSize: 18, weight: .medium)
		tf.tag = 1
		tf.textAlignment = .center
		return tf
	}()

	lazy var editUserButton: UIButton = {
		let button = UIButton()
		button.setImage(#imageLiteral(resourceName: "editUser"), for: .normal)
		button.backgroundColor = UIColor.clear
		return button
	}()
	lazy var logoutButton: UIButton = {
		let button = UIButton()
		button.setImage(#imageLiteral(resourceName: "logout"), for: .normal)
		button.backgroundColor = UIColor.clear
		return button
	}()



	//Create Toggle Container & 4 Buttons to access different options
	lazy var toggleContainer: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0)
		return view
	}()
	lazy var optionCollectionButton: UIButton = {
		let button = UIButton()
		button.setImage(#imageLiteral(resourceName: "gallery_empty"), for: .normal)
		button.setImage(#imageLiteral(resourceName: "gallery_filled"), for: .selected)
		button.backgroundColor = .clear
		return button
	}()
	lazy var optionListButton: UIButton = {
		let button = UIButton()
		button.setImage(#imageLiteral(resourceName: "list_square"), for: .normal)
		button.backgroundColor = .clear
		return button
	}()
	lazy var optionCommentButton: UIButton = {
		let button = UIButton()
		button.setImage(#imageLiteral(resourceName: "comment"), for: .normal)
		button.backgroundColor = .clear
		return button
	}()
	lazy var optionBookmarkButton: UIButton = {
		let button = UIButton()
		button.setImage(#imageLiteral(resourceName: "bookmark_empty"), for: .normal)
		button.backgroundColor = .clear
		return button
	}()


	//Create CollectionView
	lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		let cv = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
		cv.backgroundColor = UIColor.yellow
		cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionCell")
		return cv
	}()
	//Create ListView
	lazy var tableView: UITableView = {
		let tbv = UITableView()
		tbv.register(PostTableViewCell.self, forCellReuseIdentifier: "Post Cell")
		return tbv
	}()
	//Create commentView (ListView)
	lazy var commentView: UITableView = {
		let tbv = UITableView()
		//		tbv.register(CommentTableViewCell.self, forCellReuseIdentifier: "CommentPostCell")
		return tbv
	}()
	//Create bookmarkView (ListView)
	lazy var bookmarkView: UITableView = {
		let tbv = UITableView()
		return tbv
	}()


	// MARK: - Setup elements in View
	override init(frame: CGRect){
		super.init(frame: UIScreen.main.bounds)
		setupViews()
	}
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	override func layoutSubviews() {
		super.layoutSubviews()
		profileImageView.layer.cornerRadius = profileImageView.bounds.width / 4
		profileImageView.layer.masksToBounds = true
	}
	private func setupViews() {
		addProfileContainer()
		addBackgroundImageView()
		addProfileImageView()
		addUsernameTF()
		addTaglineTF()
		addEditUserButton()
		addLogoutButton()
		addToggleContainer()
		addOptionListButton()
		addOptionCollectionButton()
		addOptionCommentButton()
		addOptionBookmarkButton()
		addTableView()
//		addCollectionView()
//		addCommentView()
//		addBookmarkView()
	}


	// MARK: - Add elements & layout constraints to View
	private func addProfileContainer() {
		addSubview(profileContainer)
		profileContainer.translatesAutoresizingMaskIntoConstraints = false
		profileContainer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
		profileContainer.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
		profileContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
		profileContainer.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.4).isActive = true
	}

	private func addBackgroundImageView() {
		addSubview(backgroundImageView)
		backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
		backgroundImageView.topAnchor.constraint(equalTo: profileContainer.topAnchor).isActive = true
		backgroundImageView.leadingAnchor.constraint(equalTo: profileContainer.leadingAnchor).isActive = true
		backgroundImageView.trailingAnchor.constraint(equalTo: profileContainer.trailingAnchor).isActive = true
		backgroundImageView.heightAnchor.constraint(equalTo: profileContainer.heightAnchor, multiplier: 0.6).isActive = true
	}
	private func addProfileImageView() {
		addSubview(profileImageView)
		profileImageView.translatesAutoresizingMaskIntoConstraints = false
		profileImageView.centerYAnchor.constraint(equalTo: backgroundImageView.bottomAnchor).isActive = true
		profileImageView.heightAnchor.constraint(equalTo: backgroundImageView.heightAnchor, multiplier: 0.4).isActive = true
		profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor).isActive = true
		profileImageView.leadingAnchor.constraint(equalTo: profileContainer.leadingAnchor, constant: 10).isActive = true
	}
	private func addUsernameTF() {
		addSubview(usernameTF)
		usernameTF.translatesAutoresizingMaskIntoConstraints = false
		usernameTF.leadingAnchor.constraint(equalTo: profileContainer.leadingAnchor, constant: 10).isActive = true
		usernameTF.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 3).isActive = true
		usernameTF.widthAnchor.constraint(equalTo: profileContainer.widthAnchor, multiplier: 0.30).isActive = true
		usernameTF.heightAnchor.constraint(equalTo: profileImageView.heightAnchor, multiplier: 0.25).isActive = true
	}
	private func addEditUserButton() {
		addSubview(editUserButton)
		editUserButton.translatesAutoresizingMaskIntoConstraints = false
		editUserButton.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 3).isActive = true
		editUserButton.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -8).isActive = true
		editUserButton.widthAnchor.constraint(equalTo: profileContainer.widthAnchor, multiplier: 0.09).isActive = true
		editUserButton.heightAnchor.constraint(equalTo: profileContainer.heightAnchor, multiplier: 0.09).isActive = true
	}
	private func 	addLogoutButton() {
		addSubview(logoutButton)
		logoutButton.translatesAutoresizingMaskIntoConstraints = false
		logoutButton.topAnchor.constraint(equalTo: editUserButton.bottomAnchor, constant: 3).isActive = true
		logoutButton.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -8).isActive = true
		logoutButton.widthAnchor.constraint(equalTo: profileContainer.widthAnchor, multiplier: 0.09).isActive = true
		logoutButton.heightAnchor.constraint(equalTo: profileContainer.heightAnchor, multiplier: 0.09).isActive = true
	}
	private func addTaglineTF() {
		addSubview(taglineTF)
		taglineTF.translatesAutoresizingMaskIntoConstraints = false
		taglineTF.centerXAnchor.constraint(equalTo: profileContainer.centerXAnchor).isActive = true
		taglineTF.centerYAnchor.constraint(equalTo: profileImageView.bottomAnchor).isActive = true

		taglineTF.widthAnchor.constraint(equalTo: profileContainer.widthAnchor, multiplier: 0.5).isActive = true
		taglineTF.heightAnchor.constraint(equalTo: profileContainer.heightAnchor, multiplier: 0.2).isActive = true
	}
	private func addToggleContainer() {
		addSubview(toggleContainer)
		toggleContainer.translatesAutoresizingMaskIntoConstraints = false
		toggleContainer.leadingAnchor.constraint(equalTo: profileContainer.leadingAnchor).isActive = true
		toggleContainer.trailingAnchor.constraint(equalTo: profileContainer.trailingAnchor).isActive = true
		toggleContainer.bottomAnchor.constraint(equalTo: profileContainer.bottomAnchor).isActive = true
		toggleContainer.heightAnchor.constraint(equalTo: profileContainer.heightAnchor, multiplier: 0.18).isActive = true
	}

	private func addOptionListButton() {
		addSubview(optionListButton)
		optionListButton.translatesAutoresizingMaskIntoConstraints = false
		optionListButton.topAnchor.constraint(equalTo: toggleContainer.topAnchor).isActive = true
		optionListButton.bottomAnchor.constraint(equalTo: toggleContainer.bottomAnchor).isActive = true
		optionListButton.widthAnchor.constraint(equalTo: toggleContainer.widthAnchor, multiplier: 0.25).isActive = true
	}
	private func addOptionCollectionButton() {
		addSubview(optionCollectionButton)
		optionCollectionButton.translatesAutoresizingMaskIntoConstraints = false
		optionCollectionButton.topAnchor.constraint(equalTo: toggleContainer.topAnchor).isActive = true
		optionCollectionButton.bottomAnchor.constraint(equalTo: toggleContainer.bottomAnchor).isActive = true
		optionCollectionButton.widthAnchor.constraint(equalTo: toggleContainer.widthAnchor, multiplier: 0.25).isActive = true
		optionCollectionButton.leadingAnchor.constraint(equalTo: optionListButton.trailingAnchor).isActive = true
	}
	private func addOptionCommentButton() {
		addSubview(optionCommentButton)
		optionCommentButton.translatesAutoresizingMaskIntoConstraints = false
		optionCommentButton.topAnchor.constraint(equalTo: toggleContainer.topAnchor).isActive = true
		optionCommentButton.bottomAnchor.constraint(equalTo: toggleContainer.bottomAnchor).isActive = true
		optionCommentButton.widthAnchor.constraint(equalTo: toggleContainer.widthAnchor, multiplier: 0.25).isActive = true
		optionCommentButton.leadingAnchor.constraint(equalTo: optionCollectionButton.trailingAnchor).isActive = true
	}
	private func addOptionBookmarkButton() {
		addSubview(optionBookmarkButton)
		optionBookmarkButton.translatesAutoresizingMaskIntoConstraints = false
		optionBookmarkButton.topAnchor.constraint(equalTo: toggleContainer.topAnchor).isActive = true
		optionBookmarkButton.bottomAnchor.constraint(equalTo: toggleContainer.bottomAnchor).isActive = true
		optionBookmarkButton.widthAnchor.constraint(equalTo: toggleContainer.widthAnchor, multiplier: 0.25).isActive = true
		optionBookmarkButton.leadingAnchor.constraint(equalTo: optionCommentButton.trailingAnchor).isActive = true
	}

	//Add the different toggle options
	private func addCollectionView() {
		addSubview(collectionView)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.topAnchor.constraint(equalTo: profileContainer.bottomAnchor).isActive = true
		collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
		collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
		collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
	}
	private func addTableView() {
		addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.topAnchor.constraint(equalTo: profileContainer.bottomAnchor).isActive = true
		tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
		tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
		tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
	}
	private func addCommentView() {
		addSubview(commentView)
		commentView.translatesAutoresizingMaskIntoConstraints = false
		commentView.topAnchor.constraint(equalTo: profileContainer.bottomAnchor).isActive = true
		commentView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
		commentView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
		commentView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
	}
	private func addBookmarkView() {
		addSubview(bookmarkView)
		bookmarkView.translatesAutoresizingMaskIntoConstraints = false
		bookmarkView.topAnchor.constraint(equalTo: profileContainer.bottomAnchor).isActive = true
		bookmarkView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
		bookmarkView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
		bookmarkView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
	}


	//	public func configureProfileView(user: User) {
	public func configureProfileView(user: POSTRUser) {
		usernameTF.text = user.username
		taglineTF.text = user.userBio
		if let imageStr = user.userImageStr {
			profileImageView.kf.indicatorType = .activity
			profileImageView.kf.setImage(with: URL(string: imageStr))
//			profileImageView.kf.setImage(with: URL(string: imageStr), placeholder: #imageLiteral(resourceName: "user4"), options: nil, progressBlock: nil) { (image, error, cacheType, url) in
//			}
		}
	}

}

