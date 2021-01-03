//
//  BaseView.swift
//  CMBaseSDK
//
//  Created by Coolmint on 2021/01/03.
//

import UIKit
import SnapKit

open class BaseView: UIView {
  public init() {
    super.init(frame: .zero)
    configure()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    configure()
  }
  
  open func configure() {}
}

open class BaseTableView: UITableView {
  public init() {
    super.init(frame: .zero, style: .plain)
    rowHeight = UITableView.automaticDimension
    separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    configure()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    configure()
  }
  
  open func configure() {}
}

open class BaseGroupedTableView: UITableView {
  public init() {
    super.init(frame: .zero, style: .grouped)
    rowHeight = UITableView.automaticDimension
    sectionHeaderHeight = UITableView.automaticDimension
    sectionFooterHeight = UITableView.automaticDimension
    estimatedRowHeight = 60
    estimatedSectionHeaderHeight = 60
    estimatedSectionFooterHeight = 60
    separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    configure()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    configure()
  }
  
  open func configure() {}
}

open class BaseTableViewCell: UITableViewCell, ReusableView {
  
  public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configureContentView()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  open func configureContentView() {}
}

open class BaseScrollView: BaseView {
  public var scrollView = UIScrollView(frame: .zero)
  public var contentView = BaseView()
  public override func configure() {
    addSubview(scrollView)
    scrollView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview()
    }
    
    scrollView.addSubview(contentView)
    contentView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview()
      make.width.equalTo(scrollView.snp.width)
      make.height.equalTo(scrollView.snp.height).priority(1)
    }
  }
}
